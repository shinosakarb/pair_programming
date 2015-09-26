class BattleSystem
  attr_reader :player, :enemy

  def initialize(player, enemy)
    @player = player
    @enemy = enemy
  end

  def attack
    @enemy.hit_point -= damege.tap {|d| puts "damege = #{d}"}
    @enemy.hit_point = 0 if @enemy.hit_point < 0

    puts "enemy.hit_point = #{@enemy.hit_point}"
  end

  def finish?
    @enemy.hit_point <= 0
  end

  private
  def normal_damege
    a = @player.attack - @enemy.defence / 2
    if a < 2
      [1,2].sample
    else
      (a + (a + 1) * rand(256) / 256) / 2
    end
  end

  def critical_damege
    @player.attack - (@player.attack/2) * rand(256) / 256
  end

  def damege
    rand(32) == 0 ? critical_damege : normal_damege
  end
end
