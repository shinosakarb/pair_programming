class Game

  def initialize
    @hero = Hero.new
  	@monster = Monster.new
  	start
  end

  def start
    loop do
	    puts "スライムがあらわれた！"
	    puts "1:たたかう　2:にげる"

			cmd = gets.chomp.to_i
			if cmd == 1
        @monster.hit_point -= @hero.attack
        puts "スライムHP：#{@monster.hit_point}"
        if @monster.hit_point == 0
          break
        end
      else cmd == 2
				break
			end
    end
  end
end

class Hero
  attr_accessor :level, :attack_power, :defense_power, :hit_point, :magic_power
  def initialize
    self.level = 1
    self.attack_power = 4
    self.defense_power = 4
    self.hit_point = 15
    self.magic_power = 0
  end
  def attack(monster)
    1
    a = (attack_power - monster.defense_power) / 2
    if a < 2
      [1,2].sample
    else
      ((a+1) * (0..255).to_a.sample / 256 + a) / 2
    end
  end
end

class Monster
	attr_accessor :name, :attack_power, :defense_power, :hit_point, :experience_point

  def initialize
		self.name = "スライム"
		self.attack_power = 5
		self.defense_power = 3
		self.hit_point = 3
		self.experience_point = 1
  end
end

Game.new