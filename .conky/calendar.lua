--[[
calendar wheel by Wlourf (14 jan. 2010)

This script is designed to draw dates on a circular way on the left of the screen.
Some text can be added in the circle with the file calendar.txt (see below)
Some parameters (colors, sizes ... ) can be adjusted (see below).

As this script draw a lot of things, a short update of the conky is not necessary.

Call this script in Conky using the following before TEXT (assuming you save this script to ~/scripts/calendar.lua):
	lua_load ~/scripts/calendar.lua
	lua_draw_hook_pre draw_calendar
]]

require 'cairo'
require 'imlib2'



function string:split(delimiter)
--source for the split function : http://www.wellho.net/resources/ex.php4?item=u108/split
  local result = { }
  local from  = 1
  local delim_from, delim_to = string.find( self, delimiter, from  )
  while delim_from do
    table.insert( result, string.sub( self, from , delim_from-1 ) )
    from  = delim_to + 1
    delim_from, delim_to = string.find( self, delimiter, from  )
  end
  table.insert( result, string.sub( self, from  ) )
  return result
end


function conky_draw_calendar()
	if conky_window==nil then return end
	local width=conky_window.width
	local height=conky_window.height
	local cs=cairo_xlib_surface_create(conky_window.display, conky_window.drawable, conky_window.visual, width, height)
	cr=cairo_create(cs)
	
	-------------------------- parameters are set here -----------------------------------
	
	-- vertical center of the circle (height/2 for centered circle)
	yc=height/2
	
	--number of days to display before and after today (i.e. with range = 30 --> 60 days are displayed)
	--even number between 20 and 30 for nice effect
	range = 20
	
	--not sure of the engish words so I leave then in french !	
	--fleche (arrow) is the segment from x=0 to x=radius-xc (with xc =center of the circle) 
	--fleche for the external circle
	--fleche2 for the internal circle
	--fleche2 must be < fleche
	fleche=125
	fleche2=fleche*.75
	
	--corde (chord) is the vertical segment (where x=0) of the external circle
	--if 'corde' too close to 'height', imlib will display some warnings 
	corde=height-200
			
	--colors RGB (0-255)
	--week day
	wday={51,51,255}
	--week-end and bank holidays
	eday={255,255,153}
	--color of today
	dday={0,255,255}
	
	--vertical gradient (both circle and dates)? (true/false)
	vgradient=true
	
	--horizontal gradient for the circle? (0 to 1, 0 is the best choice for "moon like" circle )
	hgradient=0
	
	
	--you can change the font here
	font="Japan"
	--font_size (of dates) must be less than delta (= heigth of a day)
	delta = yc/(range+0.5)
	--the font-size has to be adjusted depending on the font used
	font_size=delta-1
	
	--file calendar (absolute path, can be "" if no file used)
	calendar_file="/home/wlourf/scripts/calendar.txt"
	--format of in this text file
	--MMDD;N;TEXT
	--MMDD = month day
	--N    = 0 or 1 (1 to display same colors as week-ends)
	--TEXT = Text to display (use * for multiline)

	--information text (from calendar.txt)
	info_color={255,255,204}
	--font size of text infos
	font_size_info=font_size

	
	--need to write a little image, didn't fiond a way to use a buffer
	image_tmp="/tmp/img_cal.png"
	
	
	-------------------------- end of the parameters, ouf -----------------------------------
	
	--some calculations
	--radius for external circle
	--radius2 for internal circle
	--delta = number of arcs in the circle
	radius=(corde^2+4*fleche^2)/(8*fleche)
	radius2=(corde^2+4*fleche2^2)/(8*fleche2)
 	decal=2*(delta-font_size)
	wday[1]=wday[1]/255
	wday[2]=wday[2]/255
	wday[3]=wday[3]/255	
	eday[1]=eday[1]/255
	eday[2]=eday[2]/255
	eday[3]=eday[3]/255	


	--xc =x center of external circle
	--xc2=x center of internal circle
	xc = fleche - radius	
	xc2 = fleche2 - radius2
	
	--local cs=cairo_xlib_surface_create(conky_window.display, conky_window.drawable, conky_window.visual, w, h)
	h_txt = height/(2*range+1)
	--local cs2=cairo_image_surface_create(CAIRO_FORMAT_ARGB32, 100, h_txt)
	
	-- conky_window.drawable
	cr2=cairo_create(cs2)
	
	t = os.date('*t') -- date in table

	--read the calendar file
	file = io.open(calendar_file,"r")	
	tabcal={}	
	idx=1
	if file ~= nil then
		while true do
		 	line = file:read("*l")
		    if line == nil then break end
			lineok = string.split(line,";") --text = line .. "\n" .. text
			if (#lineok)==3 then
				tabcal[idx]={lineok[1],lineok[2],lineok[3]}
				idx=idx+1
			end
		end
	end	
	angmini=math.atan((corde/2)/(radius-fleche))

	for i=-range,range do
		--get the date
		s = os.time(t) -- date in seconds
		--dd= os.date("%a-%d-%y")
		s2 = s + 3600*24*i --date diff in seconds
		--t2 = os.date('*t',s2) --date diff in table
		wd = os.date("%w",s2)
		md = os.date("%m%d",s2)
		dt = os.date("%a. %d %b.",s2),os.date("%d",s2),os.date("%b",s2)

		--percentage of vertical gradient
		pc=(range-math.abs(i))/range
		if not vgradient then pc=1 end

		--angle min et max of one block
		ang0=angmini*((i-0.5)/range)
		ang1=angmini*(i+0.5)/range
		angm=(ang0+ang1)/2
		
		--read the calendar.txt array
		flag = false
		for idy=1,idx-1 do
			if tabcal[idy][1] == md then
				if i == 0 then
					today = tabcal[idy]
				end
				if tabcal[idy][2] == "1" then
					flag = true
				end
				break
			end
			
		end

		--colors
		if wd=="6" or wd=="0" or flag == true then
			colR,colG,colB=eday[1],eday[2],eday[3]
		else
			colR,colG,colB=wday[1],wday[2],wday[3]
		end
		
		cairo_set_source_rgba (cr,colR, colG, colB,pc);
		pat = cairo_pattern_create_radial (xc, yc, radius,
		                           			xc2,yc,radius2);
		cairo_pattern_add_color_stop_rgba (pat, 0, colR, colG, colB, pc);
		cairo_pattern_add_color_stop_rgba (pat, 1, colR, colG, colB, hgradient);
		cairo_set_source (cr, pat);

		--draw the arcs
		x1,y1=radius*math.cos(ang0)+xc,radius*math.sin(ang0)+yc
		x2,y2=radius*math.cos(ang1)+xc,radius*math.sin(ang1)+yc
		xm,ym=radius*math.cos(angm)+xc,radius*math.sin(angm)+yc
	--	am=(ym-yc)/(xm-xc)
	--	bm=ym-am*xm

		cairo_move_to(cr,x1,y1)
		cairo_line_to(cr,x2,y2)
		cairo_line_to(cr,xc,yc)
		cairo_fill(cr)
		
		--lenght of the arc
		dx,dy=math.abs(x2-x1),math.abs(y2-y1)
		h_txt=math.sqrt(dx*dx+dy*dy)
		w_txt=font_size*10
		
		--write text in another image
		--didn't find to work in memory only
		local cs2=cairo_image_surface_create(CAIRO_FORMAT_ARGB32, w_txt, h_txt)
		cr2=cairo_create(cs2)
		cairo_set_font_size (cr2, font_size);
		if i==0 then 
			--weight = CAIRO_FONT_WEIGHT_BOLD
			colR, colG, colB = dday[1]/255,dday[2]/255,dday[3]/255
		--else
		--	weight = CAIRO_FONT_WEIGHT_NORMAL	
		end
		cairo_select_font_face(cr2, font, CAIRO_FONT_SLANT_NORMAL, CAIRO_FONT_WEIGHT_NORMAL)

		cairo_move_to(cr,xc+(delta+radius)*math.cos(ang0),corde/2+(radius-fleche)*math.tan(ang0))

		cairo_move_to(cr2,0,h_txt-decal)
		cairo_set_source_rgba (cr2, colR, colG, colB,pc)
		cairo_show_text(cr2, " " .. dt)
		cairo_stroke(cr2)

		cairo_surface_write_to_png(cs2,image_tmp)
		cairo_destroy(cr2)
		
		--put date text on cairo surface
		imageTmp = imlib_load_image(image_tmp)
		imlib_context_set_image(imageTmp)

		rot_img = imlib_create_rotated_image(angm)
		imlib_free_image()

		imlib_context_set_image(rot_img)

		w_img0, h_img0 = imlib_image_get_width(), imlib_image_get_height()
		
		---look for center of text
		rt=radius+w_txt/2
		xt=rt*math.cos(angm)+xc-w_img0/2
		yt=rt*math.sin(angm)+yc-h_img0/2
		imlib_render_image_on_drawable(xt,yt)
		imlib_free_image()


		--write text info if needed
		have=""
		if today ~= nil then
			cairo_select_font_face(cr, font, CAIRO_FONT_SLANT_NORMAL, CAIRO_FONT_WEIGHT_NORMAL	)
			cairo_set_line_width(cr,0)
			cairo_set_font_size(cr,font_size_info)
			cairo_set_source_rgba (cr, info_color[1]/255, info_color[2]/255, info_color[3]/255,1);

			have = string.split(today[3],"*")
			for i=1,#have do 
				cairo_move_to(cr,10,height/2+(i-#have/2)*font_size_info)
				cairo_show_text(cr, have[i])
				cairo_fill(cr)
			end
		end	

	end
end 




