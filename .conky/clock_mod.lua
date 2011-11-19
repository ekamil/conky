--[[
Clock Rings by londonali1010 (2009)
 
This script draws percentage meters as rings, and also draws clock hands if you want! It is fully customisable; all options are described in the script. This script is based off a combination of my clock.lua script and my rings.lua script.
 
IMPORTANT: if you are using the 'cpu' function, it will cause a segmentation fault if it tries to draw a ring straight away. The if statement on line 145 uses a delay to make sure that this doesn't happen. It calculates the length of the delay by the number of updates since Conky started. Generally, a value of 5s is long enough, so if you update Conky every 1s, use update_num>5 in that if statement (the default). If you only update Conky every 2s, you should change it to update_num>3; conversely if you update Conky every 0.5s, you should use update_num>10. ALSO, if you change your Conky, is it best to use "killall conky; conky" to update it, otherwise the update_num will not be reset and you will get an error.
 
 
Clock Rings Mod by Proxess (2009)
 
This modification permits you to add warning colours on both countdown values (batteries, wlan, etc) and status percentages (cpu, file system usage, etc).
 
Clock Rings Mod Mod by Crinos512 (2009)
 
This modification adds alpha to the warning colours.
 
To call this script in Conky, use the following (assuming that you save this script to ~/.conkygui/scripts/clock_mod.lua):
	lua_load ~/.conky/clock_mod.lua
	lua_draw_hook_pre clock_rings
]]
 
settings_table = {
	{
		-- Edit this table to customise your rings.
		-- You can create more rings simply by adding more elements to settings_table.
		-- "name" is the type of stat to display; you can choose from 'cpu', 'memperc', 'fs_used_perc', 'battery_used_perc'.
		name='time',
		-- "arg" is the argument to the stat type, e.g. if in Conky you would write ${cpu cpu0}, 'cpu0' would be the argument. If you would not use an argument in the Conky variable, use ''.
		arg='%H',
		-- "max" is the maximum value of the ring. If the Conky variable outputs a percentage, use 100.
		max=24,
		-- "bg_colour" is the colour of the base ring.
		ring="on",
		-- "ring" turns ring on or off
		bg_colour=0xffffff,
		-- "bg_alpha" is the alpha value of the base ring.
		bg_alpha=0.0,
		-- "fg_colour" is the colour of the indicator part of the ring.
		fg_colour=0xff8c00,
		-- "fg_alpha" is the alpha value of the indicator part of the ring.
		fg_alpha=0.9,
		-- "x" and "y" are the x and y coordinates of the centre of the ring, relative to the top left corner of the Conky window.
		x=080, y=105,
		-- "radius" is the radius of the ring.
		radius=58,
		-- "thickness" is the thickness of the ring, centred around the radius.
		thickness=28,
		-- "start_angle" is the starting angle of the ring, in degrees, clockwise from top. Value can be either positive or negative.
		start_angle=0,
		-- "end_angle" is the ending angle of the ring, in degrees, clockwise from top. Value can be either positive or negative, but must be larger than start_angle.
		end_angle=360,
		-- "color_coding" is the variable that defines if there's a colour state level
		colour_coding=false,
		-- "coding_direction" simply indicates if it's a countdown (false) or a status (true)
		coding_direction=false,
		-- "warning" is the value that defines the state of the warning
		warning=0,
		-- "warning_colour" is the value that defines the state of the warning
		warning_colour=0xFFFE4E,
		-- "warning_alpha" is the alpha value of the indicator part of the ring during the state of the warning.
		warning_alpha=0.5,
		-- "danger" is the value that defines the state of the danger
		danger=0,
		-- "danger_colour" is the value that defines the state of the danger
		danger_colour=0x840000,
		-- "danger_alpha" is the alpha value of the indicator part of the ring during the state of the danger.
		danger_alpha=0.8
    },
	{
		name='time',
		arg='+%M.%S',
		max=60,
		ring="on",
		bg_colour=0xE3E3E3,
		bg_alpha=0.0,
		fg_colour=0x00BFFF,
		fg_alpha=0.9,
		x=80, y=105,
		radius=58,
		thickness=6,
		start_angle=0,
		end_angle=360,
		colour_coding=false,
		coding_direction=false,
		warning=0,
		warning_colour=0xFFFE4E,
		warning_alpha=0.5,
		danger=10,
		danger_colour=0x840000,
		danger_alpha=0.8
	},
	{
		name='time',
		arg='+%S',
		max=60,
		ring="on",
		bg_colour=0xCDCDC1,
		bg_alpha=0.0,
		fg_colour=0x7FFF00,
		fg_alpha=0.9,
		x=80, y=105,
		radius=70,
		thickness=3,
		start_angle=0,
		end_angle=360,
		colour_coding=false,
		coding_direction=false,
		warning=0,
		warning_colour=0xFFFE4E,
		warning_alpha=0.5,
		danger=10,
		danger_colour=0x840000,
		danger_alpha=0.8
	},
	{
		name='memperc',
		arg='',
		ring="on",
		max=100,
		bg_colour=0xE3E3E3,
		bg_alpha=0.0,
		fg_colour=0x00BFFF,
		fg_alpha=0.9,
		x=1200, y=105,
		radius=55,
		thickness=5,
		start_angle=0,
		end_angle=360,
		colour_coding=true,
		coding_direction=true,
		warning=70,
		warning_colour=0xFFFE4E,
		warning_alpha=0.5,
		danger=90,
		danger_colour=0x840000,
		danger_alpha=0.8
	},
	{
		name='fs_used_perc',
		arg='/',
		ring="on",
		max=100,
		bg_colour=0xFFFFFF,
		bg_alpha=0.0,
		fg_colour=0x00FF00,
		fg_alpha=0.9,
		x=1200, y=105,
		radius=65,
		thickness=10,
		start_angle=0,
		end_angle=360,
		colour_coding=true,
		coding_direction=true,
		warning=70,
		warning_colour=0xFFFE4E,
		warning_alpha=0.5,
		danger=90,
		danger_colour=0x840000,
		danger_alpha=0.8
	},
}
 
-- Use these settings to define the origin and extent of your clock.
clock_r=70 -- Original: clock_r=125 see my %S
 
-- "clock_x" and "clock_y" are the coordinates of the centre of the clock, in pixels, from the top left of the Conky window.
clock_x=80
clock_y=105
 
-- Colour & alpha of the clock hands
hour_colour=0xFF8C00
minute_colour=0x00BFFF
second_colour=0x7FFF00
clock_alpha=0.9
 
-- Do you want to show the seconds hand?
show_seconds=true
 
require 'cairo'
 
function rgb_to_r_g_b(colour,alpha)
	return ((colour / 0x10000) % 0x100) / 255., ((colour / 0x100) % 0x100) / 255., (colour % 0x100) / 255., alpha
end
 
function draw_ring(cr,t,pt)
	local w,h=conky_window.width,conky_window.height
 
	local xc,yc,ring_r,ring_w,sa,ea=pt['x'],pt['y'],pt['radius'],pt['thickness'],pt['start_angle'],pt['end_angle']
	local bgc, bga, fgc, fga=pt['bg_colour'], pt['bg_alpha'], pt['fg_colour'], pt['fg_alpha']
 
	local angle_0=sa*(2*math.pi/360)-math.pi/2
	local angle_f=ea*(2*math.pi/360)-math.pi/2
	local t_arc=t*(angle_f-angle_0)
 
	local cc, cd=pt['colour_coding'], pt['coding_direction']
	local wn, dn=pt['warning'], pt['danger']
	local wa, wc, da, dc=pt['warning_alpha'], pt['warning_colour'], pt['danger_alpha'], pt['danger_colour']
 
	local str=''
	local value=0
 
	str=string.format('${%s %s}',pt['name'],pt['arg'])
	str=conky_parse(str)
	value=tonumber(str)
 
	-- Draw background ring
	cairo_arc(cr,xc,yc,ring_r,angle_0,angle_f)
	cairo_set_line_width(cr,ring_w)
	cairo_set_source_rgba(cr,rgb_to_r_g_b(bgc,bga))
	cairo_stroke(cr)
 
	-- Draw indicator ring
	cairo_arc(cr,xc,yc,ring_r,angle_0,angle_0+t_arc)
	if cc == false then
		cairo_set_source_rgba(cr,rgb_to_r_g_b(fgc,fga))
	else
		if cd == true then
			if value < wn then
				cairo_set_source_rgba(cr,rgb_to_r_g_b(fgc,fga))
			elseif value >= dn then
				cairo_set_source_rgba(cr,rgb_to_r_g_b(dc,da))
			else
				cairo_set_source_rgba(cr,rgb_to_r_g_b(wc,wa))
			end
		else
			if value > wn then
				cairo_set_source_rgba(cr,rgb_to_r_g_b(fgc,fga))
			elseif value < = dn then
				cairo_set_source_rgba(cr,rgb_to_r_g_b(dc,da))
			else
				cairo_set_source_rgba(cr,rgb_to_r_g_b(wc,wa))
			end
		end
	end
 
	cairo_stroke(cr)
end
 
 
function draw_clock_hands(cr,xc,yc)
	local secs,mins,hours,secs_arc,mins_arc,hours_arc
	local xh,yh,xm,ym,xs,ys
 
	secs=os.date("%S")
	mins=os.date("%M")
	hours=os.date("%I")
 
	secs_arc=(2*math.pi/60)*secs
	mins_arc=(2*math.pi/60)*mins+secs_arc/60
	hours_arc=(2*math.pi/24)*hours+mins_arc/24
 
	-- Draw hour hand
 
	xh=xc+0.7*clock_r*math.sin(hours_arc)
	yh=yc-0.7*clock_r*math.cos(hours_arc)
	cairo_move_to(cr,xc,yc)
	cairo_line_to(cr,xh,yh)
 
	cairo_set_line_cap(cr,CAIRO_LINE_CAP_ROUND)
	cairo_set_line_width(cr,5)
	cairo_set_source_rgba(cr,rgb_to_r_g_b(hour_colour,clock_alpha))
	cairo_stroke(cr)
 
	-- Draw minute hand
 
	xm=xc+0.82*clock_r*math.sin(mins_arc)
	ym=yc-0.82*clock_r*math.cos(mins_arc)
	cairo_move_to(cr,xc,yc)
	cairo_line_to(cr,xm,ym)
 
	cairo_set_line_width(cr,3)
	cairo_set_source_rgba(cr,rgb_to_r_g_b(minute_colour,clock_alpha))
	cairo_stroke(cr)
 
	-- Draw seconds hand
 
	if show_seconds then
		xs=xc+clock_r*math.sin(secs_arc)
		ys=yc-clock_r*math.cos(secs_arc)
		cairo_move_to(cr,xc,yc)
		cairo_line_to(cr,xs,ys)
 
		cairo_set_line_width(cr,1)
		cairo_set_source_rgba(cr,rgb_to_r_g_b(second_colour,clock_alpha))
		cairo_stroke(cr)
	end
end
 
function conky_clock_rings()
	local function setup_rings(cr,pt)
		local str=''
		local value=0
 
		str=string.format('${%s %s}',pt['name'],pt['arg'])
		str=conky_parse(str)
 
		value=tonumber(str)
		if value == nil then value = 0 end
		pct=value/pt['max']
 
		draw_ring(cr,pct,pt)
	end
 
	-- Check that Conky has been running for at least 5s
 
	if conky_window==nil then return end
	local cs=cairo_xlib_surface_create(conky_window.display,conky_window.drawable,conky_window.visual, conky_window.width,conky_window.height)
 
	local cr=cairo_create(cs)
 
	local updates=conky_parse('${updates}')
	update_num=tonumber(updates)
 
	if update_num>5 then
		for i in pairs(settings_table) do
			setup_rings(cr,settings_table[i])
		end
	end
	draw_clock_hands(cr,clock_x,clock_y)
end
