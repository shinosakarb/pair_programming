class Game

  def initialize
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

Game.new