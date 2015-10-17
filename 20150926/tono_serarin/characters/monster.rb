class Monster
  attr_accessor :name, :attack_power, :defense_power, :hit_point, :magic_power, :experience_point

  def initialize
    self.name = "スライム"
    self.attack_power = 5
    self.defense_power = 3
    self.hit_point = 3
    self.magic_power = 0
    self.experience_point = 1
  end

  def attack(hero)
    # Ａ＝（敵の攻撃力＊２－勇者の守備力）／２
    a = (attack_power * 2 - hero.defense_power) / 2
    b = (attack_power / 2) + 1
    if a <= 0
      [1,2].sample
    else
      random = (0..255).to_a.sample
      if a < b
        #ダメージは、｛２＋（敵の攻撃力／２＋１）＊（０～２５５）／２５６｝／３
        (b * random  / 256 + 2) / 3
      else
        # Ａ＞敵の攻撃力／２＋１の場合、ダメージは、｛Ａ＋（Ａ＋１）＊（０～２５５）／２５６｝／２
        ((a + 1) * random / 256 + 2) / 2
      end
    end
  end
end
