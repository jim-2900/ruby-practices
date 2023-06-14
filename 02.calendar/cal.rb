#!/usr/bin/env ruby

require 'optparse'
require 'date'

params = ARGV.getopts("y:m:")


y = params["y"].to_i
m = params["m"].to_i

if params["y"] == nil && params["m"] == nil
  y = Date.today.year
  m = Date.today.month
elsif params["y"] == nil
  y = Date.today.year
elsif params["m"] == nil
  m = Date.today.month
end

a = 0
d = 2
date1 = Date.new(y, m, 1)
wday1 = date1.wday
date_today = Date.today
date_last = Date.new(y, m, -1)

puts "      #{m}月 #{y}   "
puts "日 月 火 水 木 金 土"
date1 = Date.new(y, m, 1)
wday1 = date1.wday

# day 1 
while a < 7 

  if wday1 == a && a == 0
    print " "
    print 1
  elsif wday1 == a && wday1 == 6
    puts 1
  elsif wday1 == a 
    print 1
  elsif wday1 >= a && a == 0
    print "    "
  elsif wday1 >= a 
    print "   "
  end

  a += 1 
end

# day 2~
while d < 32 do

date = Date.new(y, m, d)

today_color = "\e[30m\e[47m#{d}"
color_reset = "\e[39m\e[49m"

  if  date.saturday? && date == date_today && d > 9
    puts " #{today_color}"
    print color_reset
  
  elsif date.saturday? && d > 9  
    puts " #{d}"
  
  elsif date.sunday? && date == date_today && d > 9
    print today_color
    print color_reset
 
  elsif date.sunday? && d > 9 
    print d 
  
  elsif date == date_today && d > 9 
    print " #{today_color}"
    print color_reset
  
  elsif  d > 9
    print " #{d}"

    # d < 10
  elsif date.saturday? && date == date_today 
    puts "  #{today_color}"
    print color_reset
  
  elsif date.saturday? 
    puts "  #{d}"
  
  elsif date.sunday? && date == date_today
    print " #{today_color}"
    print color_reset
  
  elsif date.sunday?
    print " #{d}"
    print  
  
  else 
    print "  #{d}"
  
  end

  if date ==  date_last
    return
  end

  d += 1
end

