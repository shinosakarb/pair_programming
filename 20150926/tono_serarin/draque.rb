require "./characters/hero"
require "./characters/monster"
require "./characters/monsters/slime"
require "./characters/monsters/chimera"
require "./characters/monsters/dragon"

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
    # if @hero.level >= 7
    #   @monster = DragonKing.new
    # else
      @monster = [Slime, Chimera, Dragon].sample.new
    # end
    puts "#{@monster.name}があらわれた！"
    loop do
      puts "1:たたかう　2:にげる"

      cmd = gets.chomp.to_i
      if cmd == 1

        @monster.hit_point -= @hero.attack(@monster)
        @monster.display_state

        if @monster.hit_point <= 0
          puts "#{@monster.name}は倒れた。"
          experience_point = @monster.experience_point
          puts "経験値を#{experience_point}手に入れた！"
          @hero.add_experience_point(experience_point)
          break
        end

        @hero.hit_point -= @monster.attack(@hero)
        @hero.display_state

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

Game.new
