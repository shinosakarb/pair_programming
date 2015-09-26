#!/usr/bin/env ruby

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

puts 'スライムが現れた!'
puts
loop do
  puts '1. たたかう'
  puts '2. にげる'
  print '? '
  input_command = gets.to_i
  break if input_command == 2
  puts '攻撃した'
end
