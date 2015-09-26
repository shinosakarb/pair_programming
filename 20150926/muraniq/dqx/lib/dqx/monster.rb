module Dqx
  class Monster
    include Virtus.model

    attribute :name, String
    attribute :attack_power, Integer
    attribute :defence_power, Integer
    attribute :hit_point, Integer
    attribute :experience_point, Integer

    def attack(hero)
      puts name + "の攻撃"
      base_damage = (attack_power * 2 - hero.defence_power) / 2
      if base_damage <= 0
        damage = rand(2) + 1
      elsif base_damage < attack_power / 2 + 1
        damage = (2 + (attack_power / 2 + 1) * rand(256) / 256) / 3
      else
        damage = (base_damage + (base_damage + 1) * rand(256) / 256) / 2
      end
      puts "  " + damage.to_s.concat("のダメージ！")
      hero.defence(damage)
    end

    def defence(damage)
      self.hit_point -= damage
    end

    def alive?
      if hit_point <= 0
        false
      else
        true
      end
    end

    def self.generate
      case rand(3)
      when 0
        Monster.new(:name => "スライム", :attack_power => 5, :defence_power => 3, \
                    :hit_point => 3, :experience_point => 1)
      when 1
        Monster.new(:name => "スライムベス", :attack_power => 7, :defence_power => 3, \
                    :hit_point => 4, :experience_point => 1)
      when 2
        Monster.new(:name => "ドラキー", :attack_power => 9, :defence_power => 6, \
                    :hit_point => 5, :experience_point => 2)
      end
    end
  end
end
