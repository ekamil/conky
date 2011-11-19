#!/bin/bash
wget -O ~/.conky/ics1 http://ical.wunderground.com/auto/ical/global/stations/12375.ics?units=metric
sed  's/\./\n/g' ~/.conky/ics1 > ~/.conky/ics
egrep -i 'description|monday|tuesday|wednesday|thursday|friday|saturday|sunday|high|low|wind' ~/.conky/ics >~/.conky/messages.wun
sed -i 's/DESCRIPTION://g' ~/.conky/messages.wun
sed -i 's/\\n/\n/g' ~/.conky/messages.wun
sed -i 's/ - /\n/g' ~/.conky/messages.wun
sed -i 's/High/\nHigh/g' ~/.conky/messages.wun
sed -i 's/Low/\nLow/g' ~/.conky/messages.wun
cp ~/.conky/messages.wun ~/.conky/temp1.wun
sed -i 's/Wind /\n/g' ~/.conky/messages.wun
sed -i '/^ /d' ~/.conky/messages.wun
sed -i '/^$/d' ~/.conky/messages.wun
sed -i 's/Wind/\nWind/g' ~/.conky/temp1.wun
sed -i 's/\./\n/g' ~/.conky/temp1.wun
grep -i Wind ~/.conky/temp1.wun>~/.conky/wind-icons-messages.wun
sed -i 's/Wind //g' ~/.conky/wind-icons-messages.wun
sed -i 's/ km\/h//g' ~/.conky/wind-icons-messages.wun
cut -c1-3 ~/.conky/wind-icons-messages.wun >~/.conky/icons.wun

if [ -e ~/.conky/14 ]
then
rm ~/.conky/14
fi
if [ -e ~/.conky/13 ]
then
rm ~/.conky/13
fi
if [ -e ~/.conky/12 ]
then
rm ~/.conky/12
fi

a=`sed -n '$=' ~/.conky/wind-icons-messages.wun`
if  [ $a -eq "13" ];
then sed -i '1s/^/Today\n   -\n       -                \n        -                \n/' ~/.conky/messages.wun
sed -i '1s/^/\n/' ~/.conky/icons.wun
echo $a>~/.conky/13
elif [ $a -eq "12" ];
then sed -i '12s/$/\n\n/' ~/.conky/icons.wun
sed -i '48s/$/\n\n   -\n       -                \n        -                \n\n   -\n       -                \n        -                \n/' ~/.conky/messages.wun
echo $a>~/.conky/12
elif [ $a -eq "14" ];
then echo $a>~/.conky/14
fi;
a=`sed -n '2p' ~/.conky/messages.wun`
if test "$a" = "Chance of Flurries"
then sed -i '14s/$/\np/' ~/.conky/icons.wun
elif test "$a" = "Chance of Rain"
then sed -i '14s/$/\nh/' ~/.conky/icons.wun
elif test "$a" = "Chance of Freezing Rain"
then sed -i '14s/$/\nv/' ~/.conky/icons.wun
elif test "$a" = "Chance of Sleet"
then sed -i '14s/$/\nw/' ~/.conky/icons.wun
elif test "$a" = "Chance of Snow"
then sed -i '14s/$/\nq/' ~/.conky/icons.wun
elif test "$a" = "Chance of Thunderstorms"
then sed -i '14s/$/\nn/' ~/.conky/icons.wun
elif test "$a" = "Chance of a Thunderstorm"
then sed -i '14s/$/\nm/' ~/.conky/icons.wun
elif test "$a" = "Clear"
then sed -i '14s/$/\na/' ~/.conky/icons.wun
elif test "$a" = "Cloudy"
then sed -i '14s/$/\nd/' ~/.conky/icons.wun
elif test "$a" = "Flurries"
then sed -i '14s/$/\np/' ~/.conky/icons.wun
elif test "$a" = "Fog"
then sed -i '14s/$/\n0/' ~/.conky/icons.wun
elif test "$a" = "Hazy"
then sed -i '14s/$/\n0/' ~/.conky/icons.wun
elif test "$a" = "Mostly Cloudy"
then sed -i '14s/$/\nc/' ~/.conky/icons.wun
elif test "$a" = "Mostly Sunny"
then sed -i '14s/$/\nb/' ~/.conky/icons.wun
elif test "$a" = "Partly Cloudy"
then sed -i '14s/$/\nc/' ~/.conky/icons.wun
elif test "$a" = "Partly Sunny"
then sed -i '14s/$/\nc/' ~/.conky/icons.wun
elif test "$a" = "Freezing Rain"
then sed -i '14s/$/\nv/' ~/.conky/icons.wun
elif test "$a" = "Rain"
then sed -i '14s/$/\ni/' ~/.conky/icons.wun
elif test "$a" = "Sleet"
then sed -i '14s/$/\nw/' ~/.conky/icons.wun
elif test "$a" = "Snow"
then sed -i '14s/$/\nr/' ~/.conky/icons.wun
elif test "$a" = "Sunny"
then sed -i '14s/$/\na/' ~/.conky/icons.wun
elif test "$a" = "Thunderstorms" || test "$a" = "Thunderstorm"
then sed -i '14s/$/\nn/' ~/.conky/icons.wun
elif test "$a" = "Overcast"
then sed -i '14s/$/\ne/' ~/.conky/icons.wun
elif test "$a" = "Scattered Clouds"
then sed -i '14s/$/\nb/' ~/.conky/icons.wun
else sed -i '14s/$/\n-/' ~/.conky/icons.wun
fi;
a=`sed -n '6p' ~/.conky/messages.wun`
if test "$a" = "Chance of Flurries"
then sed -i '15s/$/\nO/' ~/.conky/icons.wun
elif test "$a" = "Chance of Rain"
then sed -i '15s/$/\nG/' ~/.conky/icons.wun
elif test "$a" = "Chance of Freezing Rain"
then sed -i '15s/$/\nG/' ~/.conky/icons.wun
elif test "$a" = "Chance of Sleet"
then sed -i '15s/$/\nG/' ~/.conky/icons.wun
elif test "$a" = "Chance of Snow"
then sed -i '15s/$/\nO/' ~/.conky/icons.wun
elif test "$a" = "Chance of Thunderstorms"
then sed -i '15s/$/\nK/' ~/.conky/icons.wun
elif test "$a" = "Chance of a Thunderstorm"
then sed -i '15s/$/\nK/' ~/.conky/icons.wun
elif test "$a" = "Clear"
then sed -i '15s/$/\nA/' ~/.conky/icons.wun
elif test "$a" = "Cloudy"
then sed -i '15s/$/\nD/' ~/.conky/icons.wun
elif test "$a" = "Flurries"
then sed -i '15s/$/\nO/' ~/.conky/icons.wun
elif test "$a" = "Fog"
then sed -i '15s/$/\n0/' ~/.conky/icons.wun
elif test "$a" = "Hazy"
then sed -i '15s/$/\n0/' ~/.conky/icons.wun
elif test "$a" = "Mostly Cloudy"
then sed -i '15s/$/\nC/' ~/.conky/icons.wun
elif test "$a" = "Mostly Sunny"
then sed -i '15s/$/\nB/' ~/.conky/icons.wun
elif test "$a" = "Partly Cloudy"
then sed -i '15s/$/\nC/' ~/.conky/icons.wun
elif test "$a" = "Partly Sunny"
then sed -i '15s/$/\nC/' ~/.conky/icons.wun
elif test "$a" = "Freezing Rain"
then sed -i '15s/$/\nG/' ~/.conky/icons.wun
elif test "$a" = "Rain"
then sed -i '15s/$/\nG/' ~/.conky/icons.wun
elif test "$a" = "Sleet"
then sed -i '15s/$/\nG/' ~/.conky/icons.wun
elif test "$a" = "Snow"
then sed -i '15s/$/\nO/' ~/.conky/icons.wun
elif test "$a" = "Sunny"
then sed -i '15s/$/\nA/' ~/.conky/icons.wun
elif test "$a" = "Thunderstorms" || test "$a" = "Thunderstorm"
then sed -i '15s/$/\nK/' ~/.conky/icons.wun
elif test "$a" = "Overcast"
then sed -i '15s/$/\nD/' ~/.conky/icons.wun
elif test "$a" = "Scattered Clouds"
then sed -i '15s/$/\nB/' ~/.conky/icons.wun
else sed -i '15s/$/\n-/' ~/.conky/icons.wun
fi;
a=`sed -n '10p' ~/.conky/messages.wun`
if test "$a" = "Chance of Flurries"
then sed -i '16s/$/\np/' ~/.conky/icons.wun
elif test "$a" = "Chance of Rain"
then sed -i '16s/$/\nh/' ~/.conky/icons.wun
elif test "$a" = "Chance of Freezing Rain"
then sed -i '16s/$/\nv/' ~/.conky/icons.wun
elif test "$a" = "Chance of Sleet"
then sed -i '16s/$/\nw/' ~/.conky/icons.wun
elif test "$a" = "Chance of Snow"
then sed -i '16s/$/\nq/' ~/.conky/icons.wun
elif test "$a" = "Chance of Thunderstorms"
then sed -i '16s/$/\nn/' ~/.conky/icons.wun
elif test "$a" = "Chance of a Thunderstorm"
then sed -i '16s/$/\nm/' ~/.conky/icons.wun
elif test "$a" = "Clear"
then sed -i '16s/$/\na/' ~/.conky/icons.wun
elif test "$a" = "Cloudy"
then sed -i '16s/$/\nd/' ~/.conky/icons.wun
elif test "$a" = "Flurries"
then sed -i '16s/$/\np/' ~/.conky/icons.wun
elif test "$a" = "Fog"
then sed -i '16s/$/\n0/' ~/.conky/icons.wun
elif test "$a" = "Hazy"
then sed -i '16s/$/\n0/' ~/.conky/icons.wun
elif test "$a" = "Mostly Cloudy"
then sed -i '16s/$/\nc/' ~/.conky/icons.wun
elif test "$a" = "Mostly Sunny"
then sed -i '16s/$/\nb/' ~/.conky/icons.wun
elif test "$a" = "Partly Cloudy"
then sed -i '16s/$/\nc/' ~/.conky/icons.wun
elif test "$a" = "Partly Sunny"
then sed -i '16s/$/\nc/' ~/.conky/icons.wun
elif test "$a" = "Freezing Rain"
then sed -i '16s/$/\nv/' ~/.conky/icons.wun
elif test "$a" = "Rain"
then sed -i '16s/$/\ni/' ~/.conky/icons.wun
elif test "$a" = "Sleet"
then sed -i '16s/$/\nw/' ~/.conky/icons.wun
elif test "$a" = "Snow"
then sed -i '16s/$/\nr/' ~/.conky/icons.wun
elif test "$a" = "Sunny"
then sed -i '16s/$/\na/' ~/.conky/icons.wun
elif test "$a" = "Thunderstorms" || test "$a" = "Thunderstorm"
then sed -i '16s/$/\nn/' ~/.conky/icons.wun
elif test "$a" = "Overcast"
then sed -i '16s/$/\ne/' ~/.conky/icons.wun
elif test "$a" = "Scattered Clouds"
then sed -i '16s/$/\nb/' ~/.conky/icons.wun
else sed -i '16s/$/\n-/' ~/.conky/icons.wun
fi;
a=`sed -n '14p' ~/.conky/messages.wun`
if test "$a" = "Chance of Flurries"
then sed -i '17s/$/\nO/' ~/.conky/icons.wun
elif test "$a" = "Chance of Rain"
then sed -i '17s/$/\nG/' ~/.conky/icons.wun
elif test "$a" = "Chance of Freezing Rain"
then sed -i '17s/$/\nG/' ~/.conky/icons.wun
elif test "$a" = "Chance of Sleet"
then sed -i '17s/$/\nG/' ~/.conky/icons.wun
elif test "$a" = "Chance of Snow"
then sed -i '17s/$/\nO/' ~/.conky/icons.wun
elif test "$a" = "Chance of Thunderstorms"
then sed -i '17s/$/\nK/' ~/.conky/icons.wun
elif test "$a" = "Chance of a Thunderstorm"
then sed -i '17s/$/\nK/' ~/.conky/icons.wun
elif test "$a" = "Clear"
then sed -i '17s/$/\nA/' ~/.conky/icons.wun
elif test "$a" = "Cloudy"
then sed -i '17s/$/\nD/' ~/.conky/icons.wun
elif test "$a" = "Flurries"
then sed -i '17s/$/\nO/' ~/.conky/icons.wun
elif test "$a" = "Fog"
then sed -i '17s/$/\n0/' ~/.conky/icons.wun
elif test "$a" = "Hazy"
then sed -i '17s/$/\n0/' ~/.conky/icons.wun
elif test "$a" = "Mostly Cloudy"
then sed -i '17s/$/\nC/' ~/.conky/icons.wun
elif test "$a" = "Mostly Sunny"
then sed -i '17s/$/\nB/' ~/.conky/icons.wun
elif test "$a" = "Partly Cloudy"
then sed -i '17s/$/\nC/' ~/.conky/icons.wun
elif test "$a" = "Partly Sunny"
then sed -i '17s/$/\nC/' ~/.conky/icons.wun
elif test "$a" = "Freezing Rain"
then sed -i '17s/$/\nG/' ~/.conky/icons.wun
elif test "$a" = "Rain"
then sed -i '17s/$/\nG/' ~/.conky/icons.wun
elif test "$a" = "Sleet"
then sed -i '17s/$/\nG/' ~/.conky/icons.wun
elif test "$a" = "Snow"
then sed -i '17s/$/\nO/' ~/.conky/icons.wun
elif test "$a" = "Sunny"
then sed -i '17s/$/\nA/' ~/.conky/icons.wun
elif test "$a" = "Thunderstorms" || test "$a" = "Thunderstorm"
then sed -i '17s/$/\nK/' ~/.conky/icons.wun
elif test "$a" = "Overcast"
then sed -i '17s/$/\nD/' ~/.conky/icons.wun
elif test "$a" = "Scattered Clouds"
then sed -i '17s/$/\nB/' ~/.conky/icons.wun
else sed -i '17s/$/\n-/' ~/.conky/icons.wun
fi;
a=`sed -n '18p' ~/.conky/messages.wun`
if test "$a" = "Chance of Flurries"
then sed -i '18s/$/\np/' ~/.conky/icons.wun
elif test "$a" = "Chance of Rain"
then sed -i '18s/$/\nh/' ~/.conky/icons.wun
elif test "$a" = "Chance of Freezing Rain"
then sed -i '18s/$/\nv/' ~/.conky/icons.wun
elif test "$a" = "Chance of Sleet"
then sed -i '18s/$/\nw/' ~/.conky/icons.wun
elif test "$a" = "Chance of Snow"
then sed -i '18s/$/\nq/' ~/.conky/icons.wun
elif test "$a" = "Chance of Thunderstorms"
then sed -i '18s/$/\nn/' ~/.conky/icons.wun
elif test "$a" = "Chance of a Thunderstorm"
then sed -i '18s/$/\nm/' ~/.conky/icons.wun
elif test "$a" = "Clear"
then sed -i '18s/$/\na/' ~/.conky/icons.wun
elif test "$a" = "Cloudy"
then sed -i '18s/$/\nd/' ~/.conky/icons.wun
elif test "$a" = "Flurries"
then sed -i '18s/$/\np/' ~/.conky/icons.wun
elif test "$a" = "Fog"
then sed -i '18s/$/\n0/' ~/.conky/icons.wun
elif test "$a" = "Hazy"
then sed -i '18s/$/\n0/' ~/.conky/icons.wun
elif test "$a" = "Mostly Cloudy"
then sed -i '18s/$/\nc/' ~/.conky/icons.wun
elif test "$a" = "Mostly Sunny"
then sed -i '18s/$/\nb/' ~/.conky/icons.wun
elif test "$a" = "Partly Cloudy"
then sed -i '18s/$/\nc/' ~/.conky/icons.wun
elif test "$a" = "Partly Sunny"
then sed -i '18s/$/\nc/' ~/.conky/icons.wun
elif test "$a" = "Freezing Rain"
then sed -i '18s/$/\nv/' ~/.conky/icons.wun
elif test "$a" = "Rain"
then sed -i '18s/$/\ni/' ~/.conky/icons.wun
elif test "$a" = "Sleet"
then sed -i '18s/$/\nw/' ~/.conky/icons.wun
elif test "$a" = "Snow"
then sed -i '18s/$/\nr/' ~/.conky/icons.wun
elif test "$a" = "Sunny"
then sed -i '18s/$/\na/' ~/.conky/icons.wun
elif test "$a" = "Thunderstorms" || test "$a" = "Thunderstorm"
then sed -i '18s/$/\nn/' ~/.conky/icons.wun
elif test "$a" = "Overcast"
then sed -i '18s/$/\ne/' ~/.conky/icons.wun
elif test "$a" = "Scattered Clouds"
then sed -i '18s/$/\nb/' ~/.conky/icons.wun
else sed -i '18s/$/\n-/' ~/.conky/icons.wun
fi;
a=`sed -n '22p' ~/.conky/messages.wun`
if test "$a" = "Chance of Flurries"
then sed -i '19s/$/\nO/' ~/.conky/icons.wun
elif test "$a" = "Chance of Rain"
then sed -i '19s/$/\nG/' ~/.conky/icons.wun
elif test "$a" = "Chance of Freezing Rain"
then sed -i '19s/$/\nG/' ~/.conky/icons.wun
elif test "$a" = "Chance of Sleet"
then sed -i '19s/$/\nG/' ~/.conky/icons.wun
elif test "$a" = "Chance of Snow"
then sed -i '19s/$/\nO/' ~/.conky/icons.wun
elif test "$a" = "Chance of Thunderstorms"
then sed -i '19s/$/\nK/' ~/.conky/icons.wun
elif test "$a" = "Chance of a Thunderstorm"
then sed -i '19s/$/\nK/' ~/.conky/icons.wun
elif test "$a" = "Clear"
then sed -i '19s/$/\nA/' ~/.conky/icons.wun
elif test "$a" = "Cloudy"
then sed -i '19s/$/\nD/' ~/.conky/icons.wun
elif test "$a" = "Flurries"
then sed -i '19s/$/\nO/' ~/.conky/icons.wun
elif test "$a" = "Fog"
then sed -i '19s/$/\n0/' ~/.conky/icons.wun
elif test "$a" = "Hazy"
then sed -i '19s/$/\n0/' ~/.conky/icons.wun
elif test "$a" = "Mostly Cloudy"
then sed -i '19s/$/\nC/' ~/.conky/icons.wun
elif test "$a" = "Mostly Sunny"
then sed -i '19s/$/\nB/' ~/.conky/icons.wun
elif test "$a" = "Partly Cloudy"
then sed -i '19s/$/\nC/' ~/.conky/icons.wun
elif test "$a" = "Partly Sunny"
then sed -i '19s/$/\nC/' ~/.conky/icons.wun
elif test "$a" = "Freezing Rain"
then sed -i '19s/$/\nG/' ~/.conky/icons.wun
elif test "$a" = "Rain"
then sed -i '19s/$/\nG/' ~/.conky/icons.wun
elif test "$a" = "Sleet"
then sed -i '19s/$/\nG/' ~/.conky/icons.wun
elif test "$a" = "Snow"
then sed -i '19s/$/\nO/' ~/.conky/icons.wun
elif test "$a" = "Sunny"
then sed -i '19s/$/\nA/' ~/.conky/icons.wun
elif test "$a" = "Thunderstorms" || test "$a" = "Thunderstorm"
then sed -i '19s/$/\nK/' ~/.conky/icons.wun
elif test "$a" = "Overcast"
then sed -i '19s/$/\nD/' ~/.conky/icons.wun
elif test "$a" = "Scattered Clouds"
then sed -i '19s/$/\nB/' ~/.conky/icons.wun
else sed -i '19s/$/\n-/' ~/.conky/icons.wun
fi;
a=`sed -n '26p' ~/.conky/messages.wun`
if test "$a" = "Chance of Flurries"
then sed -i '20s/$/\np/' ~/.conky/icons.wun
elif test "$a" = "Chance of Rain"
then sed -i '20s/$/\nh/' ~/.conky/icons.wun
elif test "$a" = "Chance of Freezing Rain"
then sed -i '20s/$/\nv/' ~/.conky/icons.wun
elif test "$a" = "Chance of Sleet"
then sed -i '20s/$/\nw/' ~/.conky/icons.wun
elif test "$a" = "Chance of Snow"
then sed -i '20s/$/\nq/' ~/.conky/icons.wun
elif test "$a" = "Chance of Thunderstorms"
then sed -i '20s/$/\nn/' ~/.conky/icons.wun
elif test "$a" = "Chance of a Thunderstorm"
then sed -i '20s/$/\nm/' ~/.conky/icons.wun
elif test "$a" = "Clear"
then sed -i '20s/$/\na/' ~/.conky/icons.wun
elif test "$a" = "Cloudy"
then sed -i '20s/$/\nd/' ~/.conky/icons.wun
elif test "$a" = "Flurries"
then sed -i '20s/$/\np/' ~/.conky/icons.wun
elif test "$a" = "Fog"
then sed -i '20s/$/\n0/' ~/.conky/icons.wun
elif test "$a" = "Hazy"
then sed -i '20s/$/\n0/' ~/.conky/icons.wun
elif test "$a" = "Mostly Cloudy"
then sed -i '20s/$/\nc/' ~/.conky/icons.wun
elif test "$a" = "Mostly Sunny"
then sed -i '20s/$/\nb/' ~/.conky/icons.wun
elif test "$a" = "Partly Cloudy"
then sed -i '20s/$/\nc/' ~/.conky/icons.wun
elif test "$a" = "Partly Sunny"
then sed -i '20s/$/\nc/' ~/.conky/icons.wun
elif test "$a" = "Freezing Rain"
then sed -i '20s/$/\nv/' ~/.conky/icons.wun
elif test "$a" = "Rain"
then sed -i '20s/$/\ni/' ~/.conky/icons.wun
elif test "$a" = "Sleet"
then sed -i '20s/$/\nw/' ~/.conky/icons.wun
elif test "$a" = "Snow"
then sed -i '20s/$/\nr/' ~/.conky/icons.wun
elif test "$a" = "Sunny"
then sed -i '20s/$/\na/' ~/.conky/icons.wun
elif test "$a" = "Thunderstorms" || test "$a" = "Thunderstorm"
then sed -i '20s/$/\nn/' ~/.conky/icons.wun
elif test "$a" = "Overcast"
then sed -i '20s/$/\ne/' ~/.conky/icons.wun
elif test "$a" = "Scattered Clouds"
then sed -i '20s/$/\nb/' ~/.conky/icons.wun
else sed -i '20s/$/\n-/' ~/.conky/icons.wun
fi;
a=`sed -n '30p' ~/.conky/messages.wun`
if test "$a" = "Chance of Flurries"
then sed -i '21s/$/\nO/' ~/.conky/icons.wun
elif test "$a" = "Chance of Rain"
then sed -i '21s/$/\nG/' ~/.conky/icons.wun
elif test "$a" = "Chance of Freezing Rain"
then sed -i '21s/$/\nG/' ~/.conky/icons.wun
elif test "$a" = "Chance of Sleet"
then sed -i '21s/$/\nG/' ~/.conky/icons.wun
elif test "$a" = "Chance of Snow"
then sed -i '21s/$/\nO/' ~/.conky/icons.wun
elif test "$a" = "Chance of Thunderstorms"
then sed -i '21s/$/\nK/' ~/.conky/icons.wun
elif test "$a" = "Chance of a Thunderstorm"
then sed -i '21s/$/\nK/' ~/.conky/icons.wun
elif test "$a" = "Clear"
then sed -i '21s/$/\nA/' ~/.conky/icons.wun
elif test "$a" = "Cloudy"
then sed -i '21s/$/\nD/' ~/.conky/icons.wun
elif test "$a" = "Flurries"
then sed -i '21s/$/\nO/' ~/.conky/icons.wun
elif test "$a" = "Fog"
then sed -i '21s/$/\n0/' ~/.conky/icons.wun
elif test "$a" = "Hazy"
then sed -i '21s/$/\n0/' ~/.conky/icons.wun
elif test "$a" = "Mostly Cloudy"
then sed -i '21s/$/\nC/' ~/.conky/icons.wun
elif test "$a" = "Mostly Sunny"
then sed -i '21s/$/\nB/' ~/.conky/icons.wun
elif test "$a" = "Partly Cloudy"
then sed -i '21s/$/\nC/' ~/.conky/icons.wun
elif test "$a" = "Partly Sunny"
then sed -i '21s/$/\nC/' ~/.conky/icons.wun
elif test "$a" = "Freezing Rain"
then sed -i '21s/$/\nG/' ~/.conky/icons.wun
elif test "$a" = "Rain"
then sed -i '21s/$/\nG/' ~/.conky/icons.wun
elif test "$a" = "Sleet"
then sed -i '21s/$/\nG/' ~/.conky/icons.wun
elif test "$a" = "Snow"
then sed -i '21s/$/\nO/' ~/.conky/icons.wun
elif test "$a" = "Sunny"
then sed -i '21s/$/\nA/' ~/.conky/icons.wun
elif test "$a" = "Thunderstorms" || test "$a" = "Thunderstorm"
then sed -i '21s/$/\nK/' ~/.conky/icons.wun
elif test "$a" = "Overcast"
then sed -i '21s/$/\nD/' ~/.conky/icons.wun
elif test "$a" = "Scattered Clouds"
then sed -i '21s/$/\nB/' ~/.conky/icons.wun
else sed -i '21s/$/\n-/' ~/.conky/icons.wun
fi;
a=`sed -n '34p' ~/.conky/messages.wun`
if test "$a" = "Chance of Flurries"
then sed -i '22s/$/\np/' ~/.conky/icons.wun
elif test "$a" = "Chance of Rain"
then sed -i '22s/$/\nh/' ~/.conky/icons.wun
elif test "$a" = "Chance of Freezing Rain"
then sed -i '22s/$/\nv/' ~/.conky/icons.wun
elif test "$a" = "Chance of Sleet"
then sed -i '22s/$/\nw/' ~/.conky/icons.wun
elif test "$a" = "Chance of Snow"
then sed -i '22s/$/\nq/' ~/.conky/icons.wun
elif test "$a" = "Chance of Thunderstorms"
then sed -i '22s/$/\nn/' ~/.conky/icons.wun
elif test "$a" = "Chance of a Thunderstorm"
then sed -i '22s/$/\nm/' ~/.conky/icons.wun
elif test "$a" = "Clear"
then sed -i '22s/$/\na/' ~/.conky/icons.wun
elif test "$a" = "Cloudy"
then sed -i '22s/$/\nd/' ~/.conky/icons.wun
elif test "$a" = "Flurries"
then sed -i '22s/$/\np/' ~/.conky/icons.wun
elif test "$a" = "Fog"
then sed -i '22s/$/\n0/' ~/.conky/icons.wun
elif test "$a" = "Hazy"
then sed -i '22s/$/\n0/' ~/.conky/icons.wun
elif test "$a" = "Mostly Cloudy"
then sed -i '22s/$/\nc/' ~/.conky/icons.wun
elif test "$a" = "Mostly Sunny"
then sed -i '22s/$/\nb/' ~/.conky/icons.wun
elif test "$a" = "Partly Cloudy"
then sed -i '22s/$/\nc/' ~/.conky/icons.wun
elif test "$a" = "Partly Sunny"
then sed -i '22s/$/\nc/' ~/.conky/icons.wun
elif test "$a" = "Freezing Rain"
then sed -i '22s/$/\nv/' ~/.conky/icons.wun
elif test "$a" = "Rain"
then sed -i '22s/$/\ni/' ~/.conky/icons.wun
elif test "$a" = "Sleet"
then sed -i '22s/$/\nw/' ~/.conky/icons.wun
elif test "$a" = "Snow"
then sed -i '22s/$/\nr/' ~/.conky/icons.wun
elif test "$a" = "Sunny"
then sed -i '22s/$/\na/' ~/.conky/icons.wun
elif test "$a" = "Thunderstorms" || test "$a" = "Thunderstorm"
then sed -i '22s/$/\nn/' ~/.conky/icons.wun
elif test "$a" = "Overcast"
then sed -i '22s/$/\ne/' ~/.conky/icons.wun
elif test "$a" = "Scattered Clouds"
then sed -i '22s/$/\nb/' ~/.conky/icons.wun
else sed -i '22s/$/\n-/' ~/.conky/icons.wun
fi;
a=`sed -n '38p' ~/.conky/messages.wun`
if test "$a" = "Chance of Flurries"
then sed -i '23s/$/\nO/' ~/.conky/icons.wun
elif test "$a" = "Chance of Rain"
then sed -i '23s/$/\nG/' ~/.conky/icons.wun
elif test "$a" = "Chance of Freezing Rain"
then sed -i '23s/$/\nG/' ~/.conky/icons.wun
elif test "$a" = "Chance of Sleet"
then sed -i '23s/$/\nG/' ~/.conky/icons.wun
elif test "$a" = "Chance of Snow"
then sed -i '23s/$/\nO/' ~/.conky/icons.wun
elif test "$a" = "Chance of Thunderstorms"
then sed -i '23s/$/\nK/' ~/.conky/icons.wun
elif test "$a" = "Chance of a Thunderstorm"
then sed -i '23s/$/\nK/' ~/.conky/icons.wun
elif test "$a" = "Clear"
then sed -i '23s/$/\nA/' ~/.conky/icons.wun
elif test "$a" = "Cloudy"
then sed -i '23s/$/\nD/' ~/.conky/icons.wun
elif test "$a" = "Flurries"
then sed -i '23s/$/\nO/' ~/.conky/icons.wun
elif test "$a" = "Fog"
then sed -i '23s/$/\n0/' ~/.conky/icons.wun
elif test "$a" = "Hazy"
then sed -i '23s/$/\n0/' ~/.conky/icons.wun
elif test "$a" = "Mostly Cloudy"
then sed -i '23s/$/\nC/' ~/.conky/icons.wun
elif test "$a" = "Mostly Sunny"
then sed -i '23s/$/\nB/' ~/.conky/icons.wun
elif test "$a" = "Partly Cloudy"
then sed -i '23s/$/\nC/' ~/.conky/icons.wun
elif test "$a" = "Partly Sunny"
then sed -i '23s/$/\nC/' ~/.conky/icons.wun
elif test "$a" = "Freezing Rain"
then sed -i '23s/$/\nG/' ~/.conky/icons.wun
elif test "$a" = "Rain"
then sed -i '23s/$/\nG/' ~/.conky/icons.wun
elif test "$a" = "Sleet"
then sed -i '23s/$/\nG/' ~/.conky/icons.wun
elif test "$a" = "Snow"
then sed -i '23s/$/\nO/' ~/.conky/icons.wun
elif test "$a" = "Sunny"
then sed -i '23s/$/\nA/' ~/.conky/icons.wun
elif test "$a" = "Thunderstorms" || test "$a" = "Thunderstorm"
then sed -i '23s/$/\nK/' ~/.conky/icons.wun
elif test "$a" = "Overcast"
then sed -i '23s/$/\nD/' ~/.conky/icons.wun
elif test "$a" = "Scattered Clouds"
then sed -i '23s/$/\nB/' ~/.conky/icons.wun
else sed -i '23s/$/\n-/' ~/.conky/icons.wun
fi;
a=`sed -n '42p' ~/.conky/messages.wun`
if test "$a" = "Chance of Flurries"
then sed -i '24s/$/\np/' ~/.conky/icons.wun
elif test "$a" = "Chance of Rain"
then sed -i '24s/$/\nh/' ~/.conky/icons.wun
elif test "$a" = "Chance of Freezing Rain"
then sed -i '24s/$/\nv/' ~/.conky/icons.wun
elif test "$a" = "Chance of Sleet"
then sed -i '24s/$/\nw/' ~/.conky/icons.wun
elif test "$a" = "Chance of Snow"
then sed -i '24s/$/\nq/' ~/.conky/icons.wun
elif test "$a" = "Chance of Thunderstorms"
then sed -i '24s/$/\nn/' ~/.conky/icons.wun
elif test "$a" = "Chance of a Thunderstorm"
then sed -i '24s/$/\nm/' ~/.conky/icons.wun
elif test "$a" = "Clear"
then sed -i '24s/$/\na/' ~/.conky/icons.wun
elif test "$a" = "Cloudy"
then sed -i '24s/$/\nd/' ~/.conky/icons.wun
elif test "$a" = "Flurries"
then sed -i '24s/$/\np/' ~/.conky/icons.wun
elif test "$a" = "Fog"
then sed -i '24s/$/\n0/' ~/.conky/icons.wun
elif test "$a" = "Hazy"
then sed -i '24s/$/\n0/' ~/.conky/icons.wun
elif test "$a" = "Mostly Cloudy"
then sed -i '24s/$/\nc/' ~/.conky/icons.wun
elif test "$a" = "Mostly Sunny"
then sed -i '24s/$/\nb/' ~/.conky/icons.wun
elif test "$a" = "Partly Cloudy"
then sed -i '24s/$/\nc/' ~/.conky/icons.wun
elif test "$a" = "Partly Sunny"
then sed -i '24s/$/\nc/' ~/.conky/icons.wun
elif test "$a" = "Freezing Rain"
then sed -i '24s/$/\nv/' ~/.conky/icons.wun
elif test "$a" = "Rain"
then sed -i '24s/$/\ni/' ~/.conky/icons.wun
elif test "$a" = "Sleet"
then sed -i '24s/$/\nw/' ~/.conky/icons.wun
elif test "$a" = "Snow"
then sed -i '24s/$/\nr/' ~/.conky/icons.wun
elif test "$a" = "Sunny"
then sed -i '24s/$/\na/' ~/.conky/icons.wun
elif test "$a" = "Thunderstorms" || test "$a" = "Thunderstorm"
then sed -i '24s/$/\nn/' ~/.conky/icons.wun
elif test "$a" = "Overcast"
then sed -i '24s/$/\ne/' ~/.conky/icons.wun
elif test "$a" = "Scattered Clouds"
then sed -i '24s/$/\nb/' ~/.conky/icons.wun
else sed -i '24s/$/\n-/' ~/.conky/icons.wun
fi;
a=`sed -n '46p' ~/.conky/messages.wun`
if test "$a" = "Chance of Flurries"
then sed -i '25s/$/\nO/' ~/.conky/icons.wun
elif test "$a" = "Chance of Rain"
then sed -i '25s/$/\nG/' ~/.conky/icons.wun
elif test "$a" = "Chance of Freezing Rain"
then sed -i '25s/$/\nG/' ~/.conky/icons.wun
elif test "$a" = "Chance of Sleet"
then sed -i '25s/$/\nG/' ~/.conky/icons.wun
elif test "$a" = "Chance of Snow"
then sed -i '25s/$/\nO/' ~/.conky/icons.wun
elif test "$a" = "Chance of Thunderstorms"
then sed -i '25s/$/\nK/' ~/.conky/icons.wun
elif test "$a" = "Chance of a Thunderstorm"
then sed -i '25s/$/\nK/' ~/.conky/icons.wun
elif test "$a" = "Clear"
then sed -i '25s/$/\nA/' ~/.conky/icons.wun
elif test "$a" = "Cloudy"
then sed -i '25s/$/\nD/' ~/.conky/icons.wun
elif test "$a" = "Flurries"
then sed -i '25s/$/\nO/' ~/.conky/icons.wun
elif test "$a" = "Fog"
then sed -i '25s/$/\n0/' ~/.conky/icons.wun
elif test "$a" = "Hazy"
then sed -i '25s/$/\n0/' ~/.conky/icons.wun
elif test "$a" = "Mostly Cloudy"
then sed -i '25s/$/\nC/' ~/.conky/icons.wun
elif test "$a" = "Mostly Sunny"
then sed -i '25s/$/\nB/' ~/.conky/icons.wun
elif test "$a" = "Partly Cloudy"
then sed -i '25s/$/\nC/' ~/.conky/icons.wun
elif test "$a" = "Partly Sunny"
then sed -i '25s/$/\nC/' ~/.conky/icons.wun
elif test "$a" = "Freezing Rain"
then sed -i '25s/$/\nG/' ~/.conky/icons.wun
elif test "$a" = "Rain"
then sed -i '25s/$/\nG/' ~/.conky/icons.wun
elif test "$a" = "Sleet"
then sed -i '25s/$/\nG/' ~/.conky/icons.wun
elif test "$a" = "Snow"
then sed -i '25s/$/\nO/' ~/.conky/icons.wun
elif test "$a" = "Sunny"
then sed -i '25s/$/\nA/' ~/.conky/icons.wun
elif test "$a" = "Thunderstorms" || test "$a" = "Thunderstorm"
then sed -i '25s/$/\nK/' ~/.conky/icons.wun
elif test "$a" = "Overcast"
then sed -i '25s/$/\nD/' ~/.conky/icons.wun
elif test "$a" = "Scattered Clouds"
then sed -i '25s/$/\nB/' ~/.conky/icons.wun
else sed -i '25s/$/\n-/' ~/.conky/icons.wun
fi;
a=`sed -n '50p' ~/.conky/messages.wun`
if test "$a" = "Chance of Flurries"
then sed -i '26s/$/\np/' ~/.conky/icons.wun
elif test "$a" = "Chance of Rain"
then sed -i '26s/$/\nh/' ~/.conky/icons.wun
elif test "$a" = "Chance of Freezing Rain"
then sed -i '26s/$/\nv/' ~/.conky/icons.wun
elif test "$a" = "Chance of Sleet"
then sed -i '26s/$/\nw/' ~/.conky/icons.wun
elif test "$a" = "Chance of Snow"
then sed -i '26s/$/\nq/' ~/.conky/icons.wun
elif test "$a" = "Chance of Thunderstorms"
then sed -i '26s/$/\nn/' ~/.conky/icons.wun
elif test "$a" = "Chance of a Thunderstorm"
then sed -i '26s/$/\nm/' ~/.conky/icons.wun
elif test "$a" = "Clear"
then sed -i '26s/$/\na/' ~/.conky/icons.wun
elif test "$a" = "Cloudy"
then sed -i '26s/$/\nd/' ~/.conky/icons.wun
elif test "$a" = "Flurries"
then sed -i '26s/$/\np/' ~/.conky/icons.wun
elif test "$a" = "Fog"
then sed -i '26s/$/\n0/' ~/.conky/icons.wun
elif test "$a" = "Hazy"
then sed -i '26s/$/\n0/' ~/.conky/icons.wun
elif test "$a" = "Mostly Cloudy"
then sed -i '26s/$/\nc/' ~/.conky/icons.wun
elif test "$a" = "Mostly Sunny"
then sed -i '26s/$/\nb/' ~/.conky/icons.wun
elif test "$a" = "Partly Cloudy"
then sed -i '26s/$/\nc/' ~/.conky/icons.wun
elif test "$a" = "Partly Sunny"
then sed -i '26s/$/\nc/' ~/.conky/icons.wun
elif test "$a" = "Freezing Rain"
then sed -i '26s/$/\nv/' ~/.conky/icons.wun
elif test "$a" = "Rain"
then sed -i '26s/$/\ni/' ~/.conky/icons.wun
elif test "$a" = "Sleet"
then sed -i '26s/$/\nw/' ~/.conky/icons.wun
elif test "$a" = "Snow"
then sed -i '26s/$/\nr/' ~/.conky/icons.wun
elif test "$a" = "Sunny"
then sed -i '26s/$/\na/' ~/.conky/icons.wun
elif test "$a" = "Thunderstorms" || test "$a" = "Thunderstorm"
then sed -i '26s/$/\nn/' ~/.conky/icons.wun
elif test "$a" = "Overcast"
then sed -i '26s/$/\ne/' ~/.conky/icons.wun
elif test "$a" = "Scattered Clouds"
then sed -i '26s/$/\nb/' ~/.conky/icons.wun
else sed -i '26s/$/\n-/' ~/.conky/icons.wun
fi;
a=`sed -n '54p' ~/.conky/messages.wun`
if test "$a" = "Chance of Flurries"
then sed -i '27s/$/\nO/' ~/.conky/icons.wun
elif test "$a" = "Chance of Rain"
then sed -i '27s/$/\nG/' ~/.conky/icons.wun
elif test "$a" = "Chance of Freezing Rain"
then sed -i '27s/$/\nG/' ~/.conky/icons.wun
elif test "$a" = "Chance of Sleet"
then sed -i '27s/$/\nG/' ~/.conky/icons.wun
elif test "$a" = "Chance of Snow"
then sed -i '27s/$/\nO/' ~/.conky/icons.wun
elif test "$a" = "Chance of Thunderstorms"
then sed -i '27s/$/\nK/' ~/.conky/icons.wun
elif test "$a" = "Chance of a Thunderstorm"
then sed -i '27s/$/\nK/' ~/.conky/icons.wun
elif test "$a" = "Clear"
then sed -i '27s/$/\nA/' ~/.conky/icons.wun
elif test "$a" = "Cloudy"
then sed -i '27s/$/\nD/' ~/.conky/icons.wun
elif test "$a" = "Flurries"
then sed -i '27s/$/\nO/' ~/.conky/icons.wun
elif test "$a" = "Fog"
then sed -i '27s/$/\n0/' ~/.conky/icons.wun
elif test "$a" = "Hazy"
then sed -i '27s/$/\n0/' ~/.conky/icons.wun
elif test "$a" = "Mostly Cloudy"
then sed -i '27s/$/\nC/' ~/.conky/icons.wun
elif test "$a" = "Mostly Sunny"
then sed -i '27s/$/\nB/' ~/.conky/icons.wun
elif test "$a" = "Partly Cloudy"
then sed -i '27s/$/\nC/' ~/.conky/icons.wun
elif test "$a" = "Partly Sunny"
then sed -i '27s/$/\nC/' ~/.conky/icons.wun
elif test "$a" = "Freezing Rain"
then sed -i '27s/$/\nG/' ~/.conky/icons.wun
elif test "$a" = "Rain"
then sed -i '27s/$/\nG/' ~/.conky/icons.wun
elif test "$a" = "Sleet"
then sed -i '27s/$/\nG/' ~/.conky/icons.wun
elif test "$a" = "Snow"
then sed -i '27s/$/\nO/' ~/.conky/icons.wun
elif test "$a" = "Sunny"
then sed -i '27s/$/\nA/' ~/.conky/icons.wun
elif test "$a" = "Thunderstorms" || test "$a" = "Thunderstorm"
then sed -i '27s/$/\nK/' ~/.conky/icons.wun
elif test "$a" = "Overcast"
then sed -i '27s/$/\nD/' ~/.conky/icons.wun
elif test "$a" = "Scattered Clouds"
then sed -i '27s/$/\nB/' ~/.conky/icons.wun
else sed -i '27s/$/\n-/' ~/.conky/icons.wun
fi;
a=`sed -n '4p' ~/.conky/messages.wun|cut -c1-3 `
if test "$a" = "Sou"
then sed -i '1s/Sou/1/g' ~/.conky/icons.wun
elif test "$a" = "SSW"
then sed -i '1s/SSW/2/g' ~/.conky/icons.wun
elif test "$a" = "SW "
then sed -i '1s/SW /3/g' ~/.conky/icons.wun
elif test "$a" = "WSW"
then sed -i '1s/WSW/4/g' ~/.conky/icons.wun
elif test "$a" = "Wes"
then sed -i '1s/Wes/5/g' ~/.conky/icons.wun
elif test "$a" = "WNW"
then sed -i '1s/WNW/6/g' ~/.conky/icons.wun
elif test "$a" = "NW "
then sed -i '1s/NW /7/g' ~/.conky/icons.wun
elif test "$a" = "NNW"
then sed -i '1s/NNW/8/g' ~/.conky/icons.wun
elif test "$a" = "Nor"
then sed -i '1s/Nor/9/g' ~/.conky/icons.wun
elif test "$a" = "NNE"
then sed -i '1s/NNE/:/g' ~/.conky/icons.wun
elif test "$a" = "NE "
then sed -i '1s/NE /;/g' ~/.conky/icons.wun
elif test "$a" = "ENE"
then sed -i '1s/ENE/</g' ~/.conky/icons.wun
elif test "$a" = "Eas"
then sed -i '1s/Eas/=/g' ~/.conky/icons.wun
elif test "$a" = "ESE"
then sed -i '1s/ESE/>/g' ~/.conky/icons.wun
elif test "$a" = "SE "
then sed -i '1s/SE /?/g' ~/.conky/icons.wun
elif test "$a" = "SSE"
then sed -i '1s/SSE/@/g' ~/.conky/icons.wun
else sed -i '1s/$/-/' ~/.conky/icons.wun
fi;
a=`sed -n '8p' ~/.conky/messages.wun|cut -c1-3 `
if test "$a" = "Sou"
then sed -i '2s/Sou/1/g' ~/.conky/icons.wun
elif test "$a" = "SSW"
then sed -i '2s/SSW/2/g' ~/.conky/icons.wun
elif test "$a" = "SW "
then sed -i '2s/SW /3/g' ~/.conky/icons.wun
elif test "$a" = "WSW"
then sed -i '2s/WSW/4/g' ~/.conky/icons.wun
elif test "$a" = "Wes"
then sed -i '2s/Wes/5/g' ~/.conky/icons.wun
elif test "$a" = "WNW"
then sed -i '2s/WNW/6/g' ~/.conky/icons.wun
elif test "$a" = "NW "
then sed -i '2s/NW /7/g' ~/.conky/icons.wun
elif test "$a" = "NNW"
then sed -i '2s/NNW/8/g' ~/.conky/icons.wun
elif test "$a" = "Nor"
then sed -i '2s/Nor/9/g' ~/.conky/icons.wun
elif test "$a" = "NNE"
then sed -i '2s/NNE/:/g' ~/.conky/icons.wun
elif test "$a" = "NE "
then sed -i '2s/NE /;/g' ~/.conky/icons.wun
elif test "$a" = "ENE"
then sed -i '2s/ENE/</g' ~/.conky/icons.wun
elif test "$a" = "Eas"
then sed -i '2s/Eas/=/g' ~/.conky/icons.wun
elif test "$a" = "ESE"
then sed -i '2s/ESE/>/g' ~/.conky/icons.wun
elif test "$a" = "SE "
then sed -i '2s/SE /?/g' ~/.conky/icons.wun
elif test "$a" = "SSE"
then sed -i '2s/SSE/@/g' ~/.conky/icons.wun
else sed -i '2s/$/-/' ~/.conky/icons.wun
fi;
a=`sed -n '12p' ~/.conky/messages.wun|cut -c1-3 `
if test "$a" = "Sou"
then sed -i '3s/Sou/1/g' ~/.conky/icons.wun
elif test "$a" = "SSW"
then sed -i '3s/SSW/2/g' ~/.conky/icons.wun
elif test "$a" = "SW "
then sed -i '3s/SW /3/g' ~/.conky/icons.wun
elif test "$a" = "WSW"
then sed -i '3s/WSW/4/g' ~/.conky/icons.wun
elif test "$a" = "Wes"
then sed -i '3s/Wes/5/g' ~/.conky/icons.wun
elif test "$a" = "WNW"
then sed -i '3s/WNW/6/g' ~/.conky/icons.wun
elif test "$a" = "NW "
then sed -i '3s/NW /7/g' ~/.conky/icons.wun
elif test "$a" = "NNW"
then sed -i '3s/NNW/8/g' ~/.conky/icons.wun
elif test "$a" = "Nor"
then sed -i '3s/Nor/9/g' ~/.conky/icons.wun
elif test "$a" = "NNE"
then sed -i '3s/NNE/:/g' ~/.conky/icons.wun
elif test "$a" = "NE "
then sed -i '3s/NE /;/g' ~/.conky/icons.wun
elif test "$a" = "ENE"
then sed -i '3s/ENE/</g' ~/.conky/icons.wun
elif test "$a" = "Eas"
then sed -i '3s/Eas/=/g' ~/.conky/icons.wun
elif test "$a" = "ESE"
then sed -i '3s/ESE/>/g' ~/.conky/icons.wun
elif test "$a" = "SE "
then sed -i '3s/SE /?/g' ~/.conky/icons.wun
elif test "$a" = "SSE"
then sed -i '3s/SSE/@/g' ~/.conky/icons.wun
else sed -i '3s/$/-/' ~/.conky/icons.wun
fi;
a=`sed -n '16p' ~/.conky/messages.wun|cut -c1-3 `
if test "$a" = "Sou"
then sed -i '4s/Sou/1/g' ~/.conky/icons.wun
elif test "$a" = "SSW"
then sed -i '4s/SSW/2/g' ~/.conky/icons.wun
elif test "$a" = "SW "
then sed -i '4s/SW /3/g' ~/.conky/icons.wun
elif test "$a" = "WSW"
then sed -i '4s/WSW/4/g' ~/.conky/icons.wun
elif test "$a" = "Wes"
then sed -i '4s/Wes/5/g' ~/.conky/icons.wun
elif test "$a" = "WNW"
then sed -i '4s/WNW/6/g' ~/.conky/icons.wun
elif test "$a" = "NW "
then sed -i '4s/NW /7/g' ~/.conky/icons.wun
elif test "$a" = "NNW"
then sed -i '4s/NNW/8/g' ~/.conky/icons.wun
elif test "$a" = "Nor"
then sed -i '4s/Nor/9/g' ~/.conky/icons.wun
elif test "$a" = "NNE"
then sed -i '4s/NNE/:/g' ~/.conky/icons.wun
elif test "$a" = "NE "
then sed -i '4s/NE /;/g' ~/.conky/icons.wun
elif test "$a" = "ENE"
then sed -i '4s/ENE/</g' ~/.conky/icons.wun
elif test "$a" = "Eas"
then sed -i '4s/Eas/=/g' ~/.conky/icons.wun
elif test "$a" = "ESE"
then sed -i '4s/ESE/>/g' ~/.conky/icons.wun
elif test "$a" = "SE "
then sed -i '4s/SE /?/g' ~/.conky/icons.wun
elif test "$a" = "SSE"
then sed -i '4s/SSE/@/g' ~/.conky/icons.wun
else sed -i '4s/$/-/' ~/.conky/icons.wun
fi;
a=`sed -n '20p' ~/.conky/messages.wun|cut -c1-3 `
if test "$a" = "Sou"
then sed -i '5s/Sou/1/g' ~/.conky/icons.wun
elif test "$a" = "SSW"
then sed -i '5s/SSW/2/g' ~/.conky/icons.wun
elif test "$a" = "SW "
then sed -i '5s/SW /3/g' ~/.conky/icons.wun
elif test "$a" = "WSW"
then sed -i '5s/WSW/4/g' ~/.conky/icons.wun
elif test "$a" = "Wes"
then sed -i '5s/Wes/5/g' ~/.conky/icons.wun
elif test "$a" = "WNW"
then sed -i '5s/WNW/6/g' ~/.conky/icons.wun
elif test "$a" = "NW "
then sed -i '5s/NW /7/g' ~/.conky/icons.wun
elif test "$a" = "NNW"
then sed -i '5s/NNW/8/g' ~/.conky/icons.wun
elif test "$a" = "Nor"
then sed -i '5s/Nor/9/g' ~/.conky/icons.wun
elif test "$a" = "NNE"
then sed -i '5s/NNE/:/g' ~/.conky/icons.wun
elif test "$a" = "NE "
then sed -i '5s/NE /;/g' ~/.conky/icons.wun
elif test "$a" = "ENE"
then sed -i '5s/ENE/</g' ~/.conky/icons.wun
elif test "$a" = "Eas"
then sed -i '5s/Eas/=/g' ~/.conky/icons.wun
elif test "$a" = "ESE"
then sed -i '5s/ESE/>/g' ~/.conky/icons.wun
elif test "$a" = "SE "
then sed -i '5s/SE /?/g' ~/.conky/icons.wun
elif test "$a" = "SSE"
then sed -i '5s/SSE/@/g' ~/.conky/icons.wun
else sed -i '5s/$/-/' ~/.conky/icons.wun
fi;
a=`sed -n '24p' ~/.conky/messages.wun|cut -c1-3 `
if test "$a" = "Sou"
then sed -i '6s/Sou/1/g' ~/.conky/icons.wun
elif test "$a" = "SSW"
then sed -i '6s/SSW/2/g' ~/.conky/icons.wun
elif test "$a" = "SW "
then sed -i '6s/SW /3/g' ~/.conky/icons.wun
elif test "$a" = "WSW"
then sed -i '6s/WSW/4/g' ~/.conky/icons.wun
elif test "$a" = "Wes"
then sed -i '6s/Wes/5/g' ~/.conky/icons.wun
elif test "$a" = "WNW"
then sed -i '6s/WNW/6/g' ~/.conky/icons.wun
elif test "$a" = "NW "
then sed -i '6s/NW /7/g' ~/.conky/icons.wun
elif test "$a" = "NNW"
then sed -i '6s/NNW/8/g' ~/.conky/icons.wun
elif test "$a" = "Nor"
then sed -i '6s/Nor/9/g' ~/.conky/icons.wun
elif test "$a" = "NNE"
then sed -i '6s/NNE/:/g' ~/.conky/icons.wun
elif test "$a" = "NE "
then sed -i '6s/NE /;/g' ~/.conky/icons.wun
elif test "$a" = "ENE"
then sed -i '6s/ENE/</g' ~/.conky/icons.wun
elif test "$a" = "Eas"
then sed -i '6s/Eas/=/g' ~/.conky/icons.wun
elif test "$a" = "ESE"
then sed -i '6s/ESE/>/g' ~/.conky/icons.wun
elif test "$a" = "SE "
then sed -i '6s/SE /?/g' ~/.conky/icons.wun
elif test "$a" = "SSE"
then sed -i '6s/SSE/@/g' ~/.conky/icons.wun
else sed -i '6s/$/-/' ~/.conky/icons.wun
fi;
a=`sed -n '28p' ~/.conky/messages.wun|cut -c1-3 `
if test "$a" = "Sou"
then sed -i '7s/Sou/1/g' ~/.conky/icons.wun
elif test "$a" = "SSW"
then sed -i '7s/SSW/2/g' ~/.conky/icons.wun
elif test "$a" = "SW "
then sed -i '7s/SW /3/g' ~/.conky/icons.wun
elif test "$a" = "WSW"
then sed -i '7s/WSW/4/g' ~/.conky/icons.wun
elif test "$a" = "Wes"
then sed -i '7s/Wes/5/g' ~/.conky/icons.wun
elif test "$a" = "WNW"
then sed -i '7s/WNW/6/g' ~/.conky/icons.wun
elif test "$a" = "NW "
then sed -i '7s/NW /7/g' ~/.conky/icons.wun
elif test "$a" = "NNW"
then sed -i '7s/NNW/8/g' ~/.conky/icons.wun
elif test "$a" = "Nor"
then sed -i '7s/Nor/9/g' ~/.conky/icons.wun
elif test "$a" = "NNE"
then sed -i '7s/NNE/:/g' ~/.conky/icons.wun
elif test "$a" = "NE "
then sed -i '7s/NE /;/g' ~/.conky/icons.wun
elif test "$a" = "ENE"
then sed -i '7s/ENE/</g' ~/.conky/icons.wun
elif test "$a" = "Eas"
then sed -i '7s/Eas/=/g' ~/.conky/icons.wun
elif test "$a" = "ESE"
then sed -i '7s/ESE/>/g' ~/.conky/icons.wun
elif test "$a" = "SE "
then sed -i '7s/SE /?/g' ~/.conky/icons.wun
elif test "$a" = "SSE"
then sed -i '7s/SSE/@/g' ~/.conky/icons.wun
else sed -i '7s/$/-/' ~/.conky/icons.wun
fi;
a=`sed -n '32p' ~/.conky/messages.wun|cut -c1-3 `
if test "$a" = "Sou"
then sed -i '8s/Sou/1/g' ~/.conky/icons.wun
elif test "$a" = "SSW"
then sed -i '8s/SSW/2/g' ~/.conky/icons.wun
elif test "$a" = "SW "
then sed -i '8s/SW /3/g' ~/.conky/icons.wun
elif test "$a" = "WSW"
then sed -i '8s/WSW/4/g' ~/.conky/icons.wun
elif test "$a" = "Wes"
then sed -i '8s/Wes/5/g' ~/.conky/icons.wun
elif test "$a" = "WNW"
then sed -i '8s/WNW/6/g' ~/.conky/icons.wun
elif test "$a" = "NW "
then sed -i '8s/NW /7/g' ~/.conky/icons.wun
elif test "$a" = "NNW"
then sed -i '8s/NNW/8/g' ~/.conky/icons.wun
elif test "$a" = "Nor"
then sed -i '8s/Nor/9/g' ~/.conky/icons.wun
elif test "$a" = "NNE"
then sed -i '8s/NNE/:/g' ~/.conky/icons.wun
elif test "$a" = "NE "
then sed -i '8s/NE /;/g' ~/.conky/icons.wun
elif test "$a" = "ENE"
then sed -i '8s/ENE/</g' ~/.conky/icons.wun
elif test "$a" = "Eas"
then sed -i '8s/Eas/=/g' ~/.conky/icons.wun
elif test "$a" = "ESE"
then sed -i '8s/ESE/>/g' ~/.conky/icons.wun
elif test "$a" = "SE "
then sed -i '8s/SE /?/g' ~/.conky/icons.wun
elif test "$a" = "SSE"
then sed -i '8s/SSE/@/g' ~/.conky/icons.wun
else sed -i '8s/$/-/' ~/.conky/icons.wun
fi;
a=`sed -n '36p' ~/.conky/messages.wun|cut -c1-3 `
if test "$a" = "Sou"
then sed -i '9s/Sou/1/g' ~/.conky/icons.wun
elif test "$a" = "SSW"
then sed -i '9s/SSW/2/g' ~/.conky/icons.wun
elif test "$a" = "SW "
then sed -i '9s/SW /3/g' ~/.conky/icons.wun
elif test "$a" = "WSW"
then sed -i '9s/WSW/4/g' ~/.conky/icons.wun
elif test "$a" = "Wes"
then sed -i '9s/Wes/5/g' ~/.conky/icons.wun
elif test "$a" = "WNW"
then sed -i '9s/WNW/6/g' ~/.conky/icons.wun
elif test "$a" = "NW "
then sed -i '9s/NW /7/g' ~/.conky/icons.wun
elif test "$a" = "NNW"
then sed -i '9s/NNW/8/g' ~/.conky/icons.wun
elif test "$a" = "Nor"
then sed -i '9s/Nor/9/g' ~/.conky/icons.wun
elif test "$a" = "NNE"
then sed -i '9s/NNE/:/g' ~/.conky/icons.wun
elif test "$a" = "NE "
then sed -i '9s/NE /;/g' ~/.conky/icons.wun
elif test "$a" = "ENE"
then sed -i '9s/ENE/</g' ~/.conky/icons.wun
elif test "$a" = "Eas"
then sed -i '9s/Eas/=/g' ~/.conky/icons.wun
elif test "$a" = "ESE"
then sed -i '9s/ESE/>/g' ~/.conky/icons.wun
elif test "$a" = "SE "
then sed -i '9s/SE /?/g' ~/.conky/icons.wun
elif test "$a" = "SSE"
then sed -i '9s/SSE/@/g' ~/.conky/icons.wun
else sed -i '9s/$/-/' ~/.conky/icons.wun
fi;
a=`sed -n '40p' ~/.conky/messages.wun|cut -c1-3 `
if test "$a" = "Sou"
then sed -i '10s/Sou/1/g' ~/.conky/icons.wun
elif test "$a" = "SSW"
then sed -i '10s/SSW/2/g' ~/.conky/icons.wun
elif test "$a" = "SW "
then sed -i '10s/SW /3/g' ~/.conky/icons.wun
elif test "$a" = "WSW"
then sed -i '10s/WSW/4/g' ~/.conky/icons.wun
elif test "$a" = "Wes"
then sed -i '10s/Wes/5/g' ~/.conky/icons.wun
elif test "$a" = "WNW"
then sed -i '10s/WNW/6/g' ~/.conky/icons.wun
elif test "$a" = "NW "
then sed -i '10s/NW /7/g' ~/.conky/icons.wun
elif test "$a" = "NNW"
then sed -i '10s/NNW/8/g' ~/.conky/icons.wun
elif test "$a" = "Nor"
then sed -i '10s/Nor/9/g' ~/.conky/icons.wun
elif test "$a" = "NNE"
then sed -i '10s/NNE/:/g' ~/.conky/icons.wun
elif test "$a" = "NE "
then sed -i '10s/NE /;/g' ~/.conky/icons.wun
elif test "$a" = "ENE"
then sed -i '10s/ENE/</g' ~/.conky/icons.wun
elif test "$a" = "Eas"
then sed -i '10s/Eas/=/g' ~/.conky/icons.wun
elif test "$a" = "ESE"
then sed -i '10s/ESE/>/g' ~/.conky/icons.wun
elif test "$a" = "SE "
then sed -i '10s/SE /?/g' ~/.conky/icons.wun
elif test "$a" = "SSE"
then sed -i '10s/SSE/@/g' ~/.conky/icons.wun
else sed -i '10s/$/-/' ~/.conky/icons.wun
fi;
a=`sed -n '44p' ~/.conky/messages.wun|cut -c1-3 `
if test "$a" = "Sou"
then sed -i '11s/Sou/1/g' ~/.conky/icons.wun
elif test "$a" = "SSW"
then sed -i '11s/SSW/2/g' ~/.conky/icons.wun
elif test "$a" = "SW "
then sed -i '11s/SW /3/g' ~/.conky/icons.wun
elif test "$a" = "WSW"
then sed -i '11s/WSW/4/g' ~/.conky/icons.wun
elif test "$a" = "Wes"
then sed -i '11s/Wes/5/g' ~/.conky/icons.wun
elif test "$a" = "WNW"
then sed -i '11s/WNW/6/g' ~/.conky/icons.wun
elif test "$a" = "NW "
then sed -i '11s/NW /7/g' ~/.conky/icons.wun
elif test "$a" = "NNW"
then sed -i '11s/NNW/8/g' ~/.conky/icons.wun
elif test "$a" = "Nor"
then sed -i '11s/Nor/9/g' ~/.conky/icons.wun
elif test "$a" = "NNE"
then sed -i '11s/NNE/:/g' ~/.conky/icons.wun
elif test "$a" = "NE "
then sed -i '11s/NE /;/g' ~/.conky/icons.wun
elif test "$a" = "ENE"
then sed -i '11s/ENE/</g' ~/.conky/icons.wun
elif test "$a" = "Eas"
then sed -i '11s/Eas/=/g' ~/.conky/icons.wun
elif test "$a" = "ESE"
then sed -i '11s/ESE/>/g' ~/.conky/icons.wun
elif test "$a" = "SE "
then sed -i '11s/SE /?/g' ~/.conky/icons.wun
elif test "$a" = "SSE"
then sed -i '11s/SSE/@/g' ~/.conky/icons.wun
else sed -i '11s/$/-/' ~/.conky/icons.wun
fi;
a=`sed -n '48p' ~/.conky/messages.wun|cut -c1-3 `
if test "$a" = "Sou"
then sed -i '12s/Sou/1/g' ~/.conky/icons.wun
elif test "$a" = "SSW"
then sed -i '12s/SSW/2/g' ~/.conky/icons.wun
elif test "$a" = "SW "
then sed -i '12s/SW /3/g' ~/.conky/icons.wun
elif test "$a" = "WSW"
then sed -i '12s/WSW/4/g' ~/.conky/icons.wun
elif test "$a" = "Wes"
then sed -i '12s/Wes/5/g' ~/.conky/icons.wun
elif test "$a" = "WNW"
then sed -i '12s/WNW/6/g' ~/.conky/icons.wun
elif test "$a" = "NW "
then sed -i '12s/NW /7/g' ~/.conky/icons.wun
elif test "$a" = "NNW"
then sed -i '12s/NNW/8/g' ~/.conky/icons.wun
elif test "$a" = "Nor"
then sed -i '12s/Nor/9/g' ~/.conky/icons.wun
elif test "$a" = "NNE"
then sed -i '12s/NNE/:/g' ~/.conky/icons.wun
elif test "$a" = "NE "
then sed -i '12s/NE /;/g' ~/.conky/icons.wun
elif test "$a" = "ENE"
then sed -i '12s/ENE/</g' ~/.conky/icons.wun
elif test "$a" = "Eas"
then sed -i '12s/Eas/=/g' ~/.conky/icons.wun
elif test "$a" = "ESE"
then sed -i '12s/ESE/>/g' ~/.conky/icons.wun
elif test "$a" = "SE "
then sed -i '12s/SE /?/g' ~/.conky/icons.wun
elif test "$a" = "SSE"
then sed -i '12s/SSE/@/g' ~/.conky/icons.wun
else sed -i '12s/$/-/' ~/.conky/icons.wun
fi;
a=`sed -n '52p' ~/.conky/messages.wun|cut -c1-3 `
if test "$a" = "Sou"
then sed -i '13s/Sou/1/g' ~/.conky/icons.wun
elif test "$a" = "SSW"
then sed -i '13s/SSW/2/g' ~/.conky/icons.wun
elif test "$a" = "SW "
then sed -i '13s/SW /3/g' ~/.conky/icons.wun
elif test "$a" = "WSW"
then sed -i '13s/WSW/4/g' ~/.conky/icons.wun
elif test "$a" = "Wes"
then sed -i '13s/Wes/5/g' ~/.conky/icons.wun
elif test "$a" = "WNW"
then sed -i '13s/WNW/6/g' ~/.conky/icons.wun
elif test "$a" = "NW "
then sed -i '13s/NW /7/g' ~/.conky/icons.wun
elif test "$a" = "NNW"
then sed -i '13s/NNW/8/g' ~/.conky/icons.wun
elif test "$a" = "Nor"
then sed -i '13s/Nor/9/g' ~/.conky/icons.wun
elif test "$a" = "NNE"
then sed -i '13s/NNE/:/g' ~/.conky/icons.wun
elif test "$a" = "NE "
then sed -i '13s/NE /;/g' ~/.conky/icons.wun
elif test "$a" = "ENE"
then sed -i '13s/ENE/</g' ~/.conky/icons.wun
elif test "$a" = "Eas"
then sed -i '13s/Eas/=/g' ~/.conky/icons.wun
elif test "$a" = "ESE"
then sed -i '13s/ESE/>/g' ~/.conky/icons.wun
elif test "$a" = "SE "
then sed -i '13s/SE /?/g' ~/.conky/icons.wun
elif test "$a" = "SSE"
then sed -i '13s/SSE/@/g' ~/.conky/icons.wun
else sed -i '13s/$/-/' ~/.conky/icons.wun
fi;
a=`sed -n '56p' ~/.conky/messages.wun|cut -c1-3 `
if test "$a" = "Sou"
then sed -i '14s/Sou/1/g' ~/.conky/icons.wun
elif test "$a" = "SSW"
then sed -i '14s/SSW/2/g' ~/.conky/icons.wun
elif test "$a" = "SW "
then sed -i '14s/SW /3/g' ~/.conky/icons.wun
elif test "$a" = "WSW"
then sed -i '14s/WSW/4/g' ~/.conky/icons.wun
elif test "$a" = "Wes"
then sed -i '14s/Wes/5/g' ~/.conky/icons.wun
elif test "$a" = "WNW"
then sed -i '14s/WNW/6/g' ~/.conky/icons.wun
elif test "$a" = "NW "
then sed -i '14s/NW /7/g' ~/.conky/icons.wun
elif test "$a" = "NNW"
then sed -i '14s/NNW/8/g' ~/.conky/icons.wun
elif test "$a" = "Nor"
then sed -i '14s/Nor/9/g' ~/.conky/icons.wun
elif test "$a" = "NNE"
then sed -i '14s/NNE/:/g' ~/.conky/icons.wun
elif test "$a" = "NE "
then sed -i '14s/NE /;/g' ~/.conky/icons.wun
elif test "$a" = "ENE"
then sed -i '14s/ENE/</g' ~/.conky/icons.wun
elif test "$a" = "Eas"
then sed -i '14s/Eas/=/g' ~/.conky/icons.wun
elif test "$a" = "ESE"
then sed -i '14s/ESE/>/g' ~/.conky/icons.wun
elif test "$a" = "SE "
then sed -i '14s/SE /?/g' ~/.conky/icons.wun
elif test "$a" = "SSE"
then sed -i '14s/SSE/@/g' ~/.conky/icons.wun
else sed -i '14s/$/-/' ~/.conky/icons.wun
fi;
