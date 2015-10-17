# -*- coding: utf-8 -*-
class Actor
  attr_reader :attack, :defence, :hit_point

  def damage(attack)
    damage_point = attack - (attack/2)*rand(256)/256
    if rand(32) == 0
      critical = attack - @defence/2
      if critical > 2
        damage_point = rand(2) + 1
      else
        damage_point = (critical + (critical + 1) * rand(256) / 256 / 2)
      end
    end
    @hit_point -= damage_point
    damage_point
  end

  def death?
    @hit_point <= 0
  end
end

class Hero < Actor
  attr_reader :level, :magic_power
  def initialize
    @level   = 1
    @attack  = 4
    @defence = 4
    @hit_point = 15
    @magic_power = 0
  end
end

class Monstar < Actor
  attr_reader :name, :experience_point
  def initialize
    @name   = "スライム"
    @attack  = 5
    @defence = 3
    @hit_point = 3
    @experience_point = 1
  end
end
