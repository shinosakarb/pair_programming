#!/usr/bin/env ruby

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'autosale'

drinks = []
drinks << Drink.new("天然水" ,80)
drinks << Drink.new("コーヒー" ,120)
drinks << Drink.new("紅茶" ,140)

stocks = []
cal = Calculation.new

puts "いらっしゃいませ！"
puts
drinks.each{|item| puts "商品名:#{item.name} 金額:#{item.money}"}
puts

loop do
  puts "リターンで終了"
  print "コインを投入 : "

  stdin = STDIN.gets.chomp.to_s
  break if stdin.empty?

  money = 0
  money = stdin.to_i unless stdin.empty?
  stocks << money

  amount = cal.displayshow(stocks)
  puts "投入金額 : [#{amount}]"

  items = drinks.select{|drink| drink.money.to_i <= amount}
  if items.count > 0
    puts
    items.each.with_index(1){|item, index| puts "商品番号:#{index} 商品名:#{item.name} 金額:#{item.money}"}
    print "商品を選んで下さい : "

    stdin = STDIN.gets.chomp.to_s
    unless stdin.empty?
      no = stdin.to_i - 1 unless stdin.empty?
      change = amount - items[no].money

      puts
      puts "商品 : [#{items[no].name}]"
      puts "おつり : [#{change}]"

      puts
      puts "ありがとうございました"
      puts
      break
    end
  end
end
