#!/usr/bin/env ruby

require 'optparse'
require 'date'

params = ARGV.getopts("y:m:")

year = params["y"].to_i
month = params["m"].to_i

if params["y"].nil?
  year = Date.today.year
end

if params["m"].nil?
  month = Date.today.month
end

first_date = Date.new(year, month, 1)
last_date = Date.new(year, month, -1)

puts "      #{month}月 #{year}"
puts "日 月 火 水 木 金 土"

print "   " * first_date.wday

(first_date..last_date).each do |date|
 

  print date.day.to_s.rjust(2)
  print " "
  
  if date.saturday?
    print "\n"
  end
end
