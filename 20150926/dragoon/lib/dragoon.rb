require "dragoon/version"
require "dragoon/character/property"
require "dragoon/character/brave"
require "dragoon/character/monster"
require "dragoon/battle"

module Dragoon
  class Main
    class << self
      def start
        puts "王様に呼ばれた勇者が、ドラゴンを倒す物語"

        print "勇者の名前 > "
        brave = Dragoon::Character::Brave.new(STDIN.gets.chomp.to_s)
        puts "おお勇者 #{brave.name} よ!"

        monster = Dragoon::Character::Monster.new("スライム")

        battle = Dragoon::Battle.new(brave, monster)
        brave = battle.start

        puts "戦いは続く..."
      end
    end
  end
end
