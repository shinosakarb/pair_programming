class Hero
  attr_accessor :level, :attack_power, :defense_power, :hit_point, :magic_power, :experience_point

  def initialize
    self.level = 1
    self.attack_power = 4
    self.defense_power = 4
    self.hit_point = 15
    self.magic_power = 0
    self.experience_point = 0
  end

  def attack(monster)
    if (1..32).to_a.sample == 1
      critical_hit
    else
      normal_attack(monster)
    end
  end

  def normal_attack(monster)
    a = (attack_power - monster.defense_power) / 2
    if a < 2
      [1,2].sample
    else
      ((a+1) * (0..255).to_a.sample / 256 + a) / 2
    end
  end

  def critical_hit
    puts "会心の一撃！！！！"
    attack_power - (attack_power / 2) * (0..255).to_a.sample / 256
  end
end