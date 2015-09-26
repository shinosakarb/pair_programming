require "dragoon/version"
require "dragoon/character/property"
require "dragoon/character/brave"
require "dragoon/character/monster"


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
        loop do
          puts "1.たたかう"
          puts "2.にげる"
          print "コマンド？> "

          stdin = gets.chomp.to_i
          if stdin == 1
            puts "#{brave.name}は #{monster.name} をこうげきした！"
          else
            puts "#{brave.name}は にげだした！"
            break
            exit
          end
        end
        puts "- 完 -"
      end
    end
  end
end
