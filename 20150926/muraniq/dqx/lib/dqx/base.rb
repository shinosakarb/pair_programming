module Dqx
  class Base
    def self.run
      hero = Hero.new(:level => 1, :attack_power => 4, :defence_power => 4, \
                      :hit_point => 15, :magic_power => 0, :experience_point => 0)
      while(true)
        self.combat(hero)
      end
    end

    def self.combat(hero)
      monster = Monster.generate

      puts "\n" + monster.name + ("が現れた！")
      
      while(monster.alive?)
        puts "勇者のHP" + hero.hit_point.to_s

        unless hero.alive?
          puts "勇者は死んでしまった"
          exit
        end

        puts "▼ コマンド？ [ 1. たたかう 2. にげる ]"

        case gets.chomp
        when "1"
          hero.attack(monster)
        when "2"
          puts "逃げ出した！"
          exit
        end

        if monster.hit_point <= 0
          puts monster.name + ("をやっつけた！")
          puts monster.experience_point.to_s + ("の経験値を獲得した！")
          hero.experience_point += monster.experience_point
          puts "現在の経験値" + hero.experience_point.to_s
        else
          monster.attack(hero)
        end
      end
    end
  end
end
