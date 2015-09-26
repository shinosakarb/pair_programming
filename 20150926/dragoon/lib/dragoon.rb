require "dragoon/version"

module Dragoon
  # Your code goes here...

  class Main
    class << self
      def start
        puts "王様に呼ばれた勇者が、ドラゴンを倒した。"

        print "勇者の名前 > "
        brave = STDIN.gets.chomp.to_s
        puts "勇者 #{brave} !"

        puts "スライムがあらわれた！"
        loop do
          puts "1.たたかう"
          puts "2.にげる"
          print "コマンド？> "

          stdin = gets.chomp.to_i
          if stdin == 1
            puts "#{brave}は スライム　をこうげきした！"
          else
            puts "#{brave}は　にげだした！"
            break
            exit
          end
        end
        puts "- 完 -"
      end
    end
  end
end
