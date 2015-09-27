class Hero
  attr_reader :level, :attack, :defense, :hit_point, :magick_power

  def initialize
    @level = 1
    @attack = 4
    @defense = 4
    @hit_point = 15
    @magick_power = 0
  end

  def action_list
    [[1, 'たたかう'],[2, 'にげる']]
  end

  def action(id, monster)
    if action_list.none?{|item| item[0] == id }
      return ''
    end

    if id == 1
      attack_action(monster)
    else
      ["逃げ出した", :end]
    end
  end

  def attack_action(monster)
    if critical_hit?
      attack_point = critical_attack(monster)
      critical_hit_message = "クリティカルヒット！"
    else
      attack_point = nomal_attack
    end

    monster_hit_point = monster.damage(attack_point)

    if monster_hit_point > 0
      ["#{critical_hit_message}敵に#{attack_point}のダメージを与えた", :continue]
    else
      ["#{critical_hit_message}敵に#{attack_point}のダメージを与えて敵を倒した", :end]
    end
  end

  def nomal_attack
    @attack - (@attack / 2) * ((0..255).to_a.sample) / 256
  end

  def critical_attack(monster)
    a = @attack - monster.defense / 2
    if a >= 2
      (a + (a + 1) * ((0..255).to_a.sample) / 256) / 2
    else
      [1, 2].sample
    end
  end

  def critical_hit?
    (1..32).to_a.sample == 1
  end
end
