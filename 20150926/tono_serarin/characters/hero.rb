class Hero
  attr_accessor :level, :attack_power, :defense_power, :hit_point, :max_hit_point, :magic_power, :experience_stock, :quickness

  def initialize
    self.level = 1
    self.attack_power = 4
    self.defense_power = 4
    self.max_hit_point = 15
    self.hit_point = max_hit_point
    self.magic_power = 0
    self.experience_stock = 0
    self.quickness = 10
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

  def add_experience_point(experience_point)
    self.experience_stock += experience_point
    while(level_up?) do
      level_up
    end
  end

  def level_up?
    if level == 1 && experience_stock >= 2
      return true
    elsif level == 2 && experience_stock >= 4
      return true
    elsif level == 3 && experience_stock >= 8
      return true
    elsif level == 4 && experience_stock >= 16
      return true
    elsif level == 5 && experience_stock >= 32
      return true
    elsif level == 6 && experience_stock >= 64
      return true
    else
      false
    end
  end

  def level_up
    self.level += 1
    puts "勇者はレベルが1上がった。Lv.#{level}になった。"
    up_status
  end

  def up_status
    case level
    when 2
      add_status(3, 1, 3, 1)
    when 3
      add_status(3, 0, 3, 1)
    when 4
      add_status(3, 1, 3, 1)
    when 5
      add_status(4, 1, 3, 1)
    when 6
      add_status(4, 1, 3, 1)
    when 7
      add_status(4, 1, 3, 1)
    else
    end
  end

  def add_status(add_attack_power, add_defense_power, add_max_hit_point, add_magic_power)
    self.attack_power += add_attack_power
    self.defense_power += add_defense_power
    self.max_hit_point += add_max_hit_point
    self.magic_power += add_magic_power
    puts "=========================="
    puts "攻撃力: #{attack_power}"
    puts "防御力: #{attack_power}"
    puts "HP: #{max_hit_point}"
    puts "MP: #{magic_power}"
    puts "=========================="
  end

  def run_away(monstar)
    quickness * (0..255).to_a.sample - (64 || 96 || 128 || 256) * monstar.defense_power * 2
  end

end
