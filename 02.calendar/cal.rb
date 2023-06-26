#!/usr/bin/env ruby

require 'optparse'
require 'date'

params = ARGV.getopts("y:m:")

year = params["y"].to_i
month = params["m"].to_i

current_year = Date.today.year
current_month = Date.today.month

if params["y"].nil?
  year = current_year
end

if params["m"].nil?
  month = current_month
end

first_day = Date.new(year, month, 1)
first_wday = first_day.wday
last_day = Date.new(year, month, -1)

puts "      #{month}月 #{year}"
puts "日 月 火 水 木 金 土" 

space = "   "
print " #{space * first_wday}1"

if first_wday == 6
  print "\n"
end

(2..last_day.day).each do |day|

  date = Date.new(year, month, day)

  if date.sunday?
    print "#{day}".rjust(2)
  elsif
    print "#{day}".rjust(3)
  end

  if date.saturday?
    print "\n"
  end

end

