# encoding: utf-8
require './actor'

taro = Hero.new
slime = Monstar.new

puts slime.name + "が現れた！"

is_game_over = false
is_escape = false
is_win = false
is_continue = true

while is_continue do
 puts "1.たたかう\n2.にげる"
 puts "コマンド?"
 str = gets
 str.chomp!

 #print 'your input:'
 #p str

 if str == "1" || str == "たたかう"
  puts "勇者の攻撃"
  damage = slime.damage(taro.attack)
  puts "#{slime.name} に #{damage} のダメージ"
  is_win = slime.death?
 end

 if str == "2" || str == "にげる"
  is_escape = true
 end

  is_continue = !(is_game_over || is_escape || is_win)
end

if is_game_over
  puts "おお、勇者よ倒れてしまうとは情けない."
end

if is_escape
  puts "にげたった."
end

if is_win
  puts "#{slime.name} を倒した."	
end