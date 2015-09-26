require 'io/console'
require File.expand_path('../battle_system', __FILE__)
require File.expand_path('../slime', __FILE__)
require File.expand_path('../hero', __FILE__)

ATTACK = '1'
ESCAPE = '2'

hero = Hero.new
monster = Slime.new
battle_system = BattleSystem.new(hero, monster)

puts "スライムが現れた！"

loop do
  puts "#{ATTACK}. たたかう"
  puts "#{ESCAPE}. にげる"
  print '?'

  input_char = STDIN.getch
  exit if input_char == ESCAPE

  battle_system.attack
  exit if battle_system.finish?
end

