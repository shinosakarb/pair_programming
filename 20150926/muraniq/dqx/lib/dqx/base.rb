module Dqx
  class Base
    def self.run
      puts "スライムが現れた！"
      
      while(true)
        puts "1. たたかう"
        puts "2. にげる"
        puts "コマンド？"

        case gets.chomp
        when "1"
          puts "スライムを殴った"
        when "2"
          puts "逃げ出した！"
          break
        end
      end
    end
  end
end
