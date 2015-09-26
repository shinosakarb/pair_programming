module Dqx
  class Hero
    include Virtus.model

    attribute :level, Integer
    attribute :attack_power, Integer
    attribute :defence_power, Integer
    attribute :hit_point, Integer
    attribute :magic_power, Integer

    def attack(monster)
      if critical?
        puts "会心の一撃！"
        damage = attack_power - (attack_power / 2) * rand(256) / 256
      else
        puts "勇者の攻撃"
        base_damage = attack_power - monster.defence_power
        if base_damage < 2
          damage = rand(2) + 1
        else
          damage = (base_damage + (base_damage + 1) * rand(256) / 256) / 2 
        end
      end
      puts "  " + damage.to_s.concat("のダメージ！")
      monster.defence(damage)
    end

    def defence(damage)
      self.hit_point -= damage
    end

    def critical?
    # 32分の1の確立で会心の一撃が出る
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
