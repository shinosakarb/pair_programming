class Game

  def initialize
    @hero = Hero.new
  	start
  end

  def start
    battle
    loop do
      if @hero.hit_point > 0
        puts "ゲームを続けますか？"
        puts "1:はい　2:いいえ"
        answer = gets.chomp.to_i
        if answer == 1
          battle
        else
          break
        end
      else
        # 勇者死んでるとき
        break
      end
    end

  end

  def battle
    @monster = [Slime, Chimera, Dragon].sample.new
    puts "#{@monster.name}があらわれた！"
    loop do
      puts "1:たたかう　2:にげる"

      cmd = gets.chomp.to_i
      if cmd == 1
        hero_attack = @hero.attack(@monster)
        @monster.hit_point -= hero_attack
        puts "勇者は#{@monster.name}に#{hero_attack}のダメージ！！"
        puts "#{@monster.name}HP：#{@monster.hit_point}"
        if @monster.hit_point <= 0
          puts "#{@monster.name}は倒れた。"
          @hero.experience_point += @monster.experience_point
          puts "経験値を#{@hero.experience_point}手に入れた！"          
          break
        end

        monster_attack = @monster.attack(@hero)
        @hero.hit_point -= monster_attack
        puts "#{@monster.name}は勇者に#{monster_attack}のダメージ！！"
        puts "勇者HP：#{@hero.hit_point}"
        if @hero.hit_point <= 0
          puts "勇者は死んでしまった..."
          break
        end

      else cmd == 2
        break
      end
    end
  end
end

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

class Slime < Monster
  def initialize
    self.name = "スライム"
    self.attack_power = 5
    self.defense_power = 3
    self.hit_point = 3
    self.experience_point = 1
  end
end

class Chimera < Monster
  def initialize
    self.name = "キメラ"
    self.attack_power = 7
    self.defense_power = 3
    self.hit_point = 6
    self.experience_point = 5
  end
end

class Dragon < Monster
  def initialize
    self.name = "ドラゴン"
    self.attack_power = 15
    self.defense_power = 5
    self.hit_point = 20
    self.experience_point = 100
  end
end


Game.new
