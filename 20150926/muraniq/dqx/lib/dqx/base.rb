module Dqx
  class Base
    def self.run
      hero = Hero.new(:level => 1, :attack_power => 4, :defence_power => 4, \
                      :hit_point => 15, :magic_power => 0)
      while(true)
        case self.combat(hero)
        when nil
          break
        end
      end
    end

    def self.combat(hero)
      slime = Slime.new(:name => "スライム", :attack_power => 5, :defence_power => 3, \
                        :hit_point => 3, :experience_point => 1)
      
      puts slime.name + ("が現れた！")
      
      while(true)
        unless hero.alive?
          puts "勇者は死んでしまった"
          break
        end

        puts "勇者のHP" + hero.hit_point.to_s
        puts "▼ コマンド？ [ 1. たたかう 2. にげる ]"

        case gets.chomp
        when "1"
          hero.attack(slime)
        when "2"
          puts "逃げ出した！"
          break
        end

        if slime.hit_point <= 0
          puts slime.name + ("をやっつけた！")
          break
        end

        slime.attack(hero)
      end
    end
  end
end
