#!/usr/bin/env ruby

require 'optparse'
require 'date'

params = ARGV.getopts("y:m:")

year = params["y"].to_i
month = params["m"].to_i

year = Date.today.year if params["y"].nil?
month = Date.today.month if params["m"].nil?

first_date = Date.new(year, month, 1)
last_date = Date.new(year, month, -1)

puts "      #{month}月 #{year}"
puts "日 月 火 水 木 金 土"
print "   " * first_date.wday

(first_date..last_date).each do |date|
 
  print "#{date.day.to_s.rjust(2)} "
  print "\n" if date.saturday?
  
end
