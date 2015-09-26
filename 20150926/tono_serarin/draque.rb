class Game

  def initialize
    Hero.new
  	Monster.new
  	start
  end

  def start
    loop do
	    puts "スライムがあらわれた！"
	    puts "1:たたかう　2:にげる"

			cmd = gets.chomp.to_i
			if cmd == 2
				break
			end
    end
  end
end

class Hero
  attr_accessor :level, :attack_power, :defense_power, :hit_point, :magic_power
  def initialize
    level = 1
    attack_power = 4
    defense_power = 4
    hit_point = 15
    magic_power = 0
  end
  def attack(moster)
    # a = (attack_power - ) / 2
    # Ａ＝勇者の攻撃力－敵の守備力／２
    # Ａ＜２の場合、ダメージは１～２
    # Ａ≧２の場合、ダメージは、｛Ａ＋（Ａ＋１）＊（０～２５５）／２５６｝／２
  end
end

class Monster
	attr_accessor: :name, :attack_power, :defense_power, :hit_point, :experience_point

  def initialize
		name = "スライム"
		attack_power = 5
		defense_power = 3
		hit_point = 3
		experience_point = 1
  end
end


Game.new