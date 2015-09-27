require "dragoon/version"
require "dragoon/character/property"
require "dragoon/character/brave"
require "dragoon/character/monster"
require "dragoon/battle"


module Dragoon
  # Your code goes here...

  class Main
    class << self
      def start
        puts "王様に呼ばれた勇者が、ドラゴンを倒した。"

        print "勇者の名前 > "
        stdin = STDIN.gets.chomp.to_s
        brave = Dragoon::Character::Brave.new(stdin)
        puts "勇者 #{brave.name} !"

        monster = Dragoon::Character::Monster.new("スライム")

        puts "#{monster.name} があらわれた！"
        battle = Dragoon::Battle.new(brave, monster)
        battle.start
        puts "- 完 -"
      end
    end
  end
end
