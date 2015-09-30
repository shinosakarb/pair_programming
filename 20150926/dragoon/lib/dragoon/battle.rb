module Dragoon
  class Battle
    def initialize(brave, monster)
      @brave = brave
      @monster = monster
    end

    def start
      puts "#{@monster.name} があらわれた！"

      loop do
        puts "1.たたかう"
        puts "2.にげる "
        print "コマンド？> "

        stdin = gets.chomp.to_i
        if stdin == 1
          puts "#{@brave.name} は #{@monster.name} をこうげきした！"
          brave
          puts "#{@monster.name} のHPは #{@monster.current_hit_point}"
        else
          puts "#{@brave.name} は にげだした！"
          break
        end
      end

      @brave
    end

    def brave
      clitical_hit = rand(32)
      if(clitical_hit == 0)
        attack_point = @brave.property.attack - @monster.property.defense / 2
        damage = attack_point * rand(256) / 256
      else
        attack_point = @brave.property.attack - @monster.property.defense / 2
        if attack_point < 2
          damage = rand(2) + 1
        else
          damage = (attack_point + (attack_point + 1) * rand(256) / 256 ) / 2
        end
      end

      if @monster.current_hit_point > damage
        @monster.current_hit_point -= damage
      else
        @monster.current_hit_point = 0
      end
    end
  end
end
