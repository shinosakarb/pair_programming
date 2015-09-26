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
        hero_attack = @hero.attack(@monster)
        @monster.hit_point -= hero_attack
        puts "勇者はスライムに#{hero_attack}のダメージ！！"
        puts "スライムHP：#{@monster.hit_point}"
        if @monster.hit_point <= 0
          break
        end

        monstar_attack = @monster.attack(@hiro)
        @hero.hit_point -= monstar_attack
        puts "スライムは勇者に#{monstar_attack}のダメージ！！"
        puts "勇者HP：#{@hero.hit_point}"
        if @hero.hit_point <= 0
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

class Monster
	attr_accessor :name, :attack_power, :defense_power, :hit_point, :experience_point

  def initialize
		self.name = "スライム"
		self.attack_power = 5
		self.defense_power = 3
		self.hit_point = 3
		self.experience_point = 1
  end

  def attack(hero)
    # Ａ＝（敵の攻撃力＊２－勇者の守備力）／２
    a = (attack_power * 2 - hero.defense_power) / 2
    puts "attack:#{a}"
    b = (attack_power / 2) + 1
    if a <= 0
      [1,2].sample
    else
      random = (0..255).to_a.sample
      puts "a:#{a}"
      puts "b:#{b}"
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

Game.new
