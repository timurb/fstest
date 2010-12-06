#!/usr/bin/ruby

require 'parser'

Parser.generate('1',15) do |s|
  puts s
end

puts "\n"
puts Parser.generate('1',15)