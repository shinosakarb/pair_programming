#!/usr/bin/env ruby

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'draque'

monster = Monster.new('スライム')
puts "#{monster.name}が現れた!"
puts
hero = Hero.new
loop do
  hero.action_list.each do |action|
    puts "#{action[0]}. #{action[1]}"
  end
  print 'コマンドを入力してください? '
  input_command = gets.to_i
  action = hero.action(input_command, monster)

  puts action[0]
  if action[1] == :end
    break
  end
end
