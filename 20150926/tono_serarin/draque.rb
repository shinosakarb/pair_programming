class Game

  def initialize
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

class Monster
	attr_accessor: :name, :attack_power, :defense_power, :hit_point, :experience_point

  def initialize
  	Monster.new	(
  		name: "スライム"
  		attack_power: 5
  		defense_power: 3
  		hit_point: 3
  		experience_point: 1
  	)
  end

end

Game.new