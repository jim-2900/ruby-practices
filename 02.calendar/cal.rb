#!/usr/bin/env ruby

require 'optparse'
require 'date'

params = ARGV.getopts("y:m:")

y = params["y"].to_i
m = params["m"].to_i

year_now = Date.today.year
month_now = Date.today.month

if params["y"] == nil && params["m"] == nil
  y = year_now
  m = month_now
elsif params["y"] == nil
  y = year_now
elsif params["m"] == nil
  m = month_now
end

first_day = Date.new(y, m, 1)
day_of_week_first_day = first_day.wday
date_today = Date.today
date_last = Date.new(y, m, -1)

puts "      #{m}月 #{y}   "
puts "日 月 火 水 木 金 土"

# day 1 

(0..6).each do |day_of_week_number|
  if  day_of_week_first_day == day_of_week_number && day_of_week_number == 0
    print " "
    print 1
  elsif day_of_week_first_day == day_of_week_number && day_of_week_number == 6
    puts 1
  elsif day_of_week_first_day == day_of_week_number
    print 1
  elsif day_of_week_first_day >= day_of_week_number && day_of_week_number == 0
    print "    "
  elsif day_of_week_first_day >= day_of_week_number
    print "   "
  end
end

# day 2~
(2..31).each do |day|

  date = Date.new(y, m, day)

  if date.saturday? && day > 9  
    puts " #{day}"
 
  elsif date.sunday? && day > 9 
    print day 
  
  elsif  day > 9
    print " #{day}"

    # d < 10
  elsif date.saturday? 
    puts "  #{day}"
  
  elsif date.sunday?
    print " #{day}"
  
  else 
    print "  #{day}"
  
  end

  if date == date_last
    return
  end
end

