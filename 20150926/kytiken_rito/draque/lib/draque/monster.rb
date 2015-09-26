class Monster
  attr_reader :name, :level, :attack, :defense, :hit_point, :experience_point

  def initialize(name)
    @name = name
    @attack = 5
    @defense = 3
    @hit_point = 3
    @experience_point = 1
  end

  def damage(attack_point)
    @hit_point -= attack_point
  end
end
