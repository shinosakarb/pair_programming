module Dqx
  class Hero
    include Virtus.model

    attribute :level, Integer
    attribute :attack_power, Integer
    attribute :defence_power, Integer
    attribute :hit_point, Integer
    attribute :magic_power, Integer

    #def Initialize
    #  self.level = 1
    #  self.attack_power = 4
    #  self.defence_power = 4
    #  self.hit_point = 15
    #  self.magic_power = 0
    #end

    def attack(slime)
      #p "敵の守備力".concat(enemy_defence_power.to_s)
      #p "勇者の攻撃力".concat(attack_power.to_s)

      if critical?
        puts "会心の一撃！"
        damage = attack_power - (attack_power / 2) * rand(256) / 256
      else
        puts "勇者の攻撃"
        base_damage = attack_power - slime.defence_power
        if base_damage < 2
          damage = rand(2) + 1
        else
          damage = (base_damage + (base_damage + 1) * rand(256) / 256) / 2 
        end
      end
      puts "  " + damage.to_s.concat("のダメージ！")
      slime.defence(damage)
    end

    def defence(damage)
      self.hit_point -= damage
    end

    def critical?
      case (rand(32) + 1) % 32
      when 0
        true
      else
        false
      end
    end

    def alive?
      if hit_point <= 0
        false
      else
        true
      end
    end

  end
end
