#!/usr/bin/env ruby
require 'rubygems'
require 'bundler/setup'

score = ARGV[0]
scores = score.split(',')
shots = []
scores.each do |s|
  if s == 'X'
    shots << 10
    shots << 0
  else
    shots << s.to_i
  end
end

frames = []
shots.each_slice(2) do |s|
  frames << s
end

point = 0
frames.each_with_index do |frame, i|
  point += if frame[0] == 10 && frames[i + 1][0] == 10 # strike
             20 + frames[i + 2][0]
           elsif frame[0] == 10
             10 + frames[i + 1].sum
           elsif frame.sum == 10 # spare
             10 + frames[i + 1][0]
           else
             frame.sum
           end
  break if i == 8
end

point += frames[9].sum
point += frames[10].sum if frames[10]
point += frames[11].sum if frames[11]

puts point
