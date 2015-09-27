# Dragoon::Battle.new
module Dragoon
  class Battle

    def initialize(brave, monster)
      @brave = brave
      @monster = monster
    end

    def start
      loop do
        puts "1.たたかう"
        puts "2.にげる"
        print "コマンド？> "
        stdin = gets.chomp.to_i
        if stdin == 1
          puts "#{@brave.name}は #{@monster.name} をこうげきした！"
        else
          puts "#{@brave.name}は にげだした！"
          break
          exit
        end
      end
    end

  end
end
