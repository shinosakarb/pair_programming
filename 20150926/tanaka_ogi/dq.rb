require 'io/console'

ATTACK = '1'
ESCAPE = '2'

loop do
  puts "スライムが現れた！"
  puts "#{ATTACK}. たたかう"
  puts "#{ESCAPE}. にげる"
  print '?'

  input_char = STDIN.getch
  exit if input_char == ESCAPE 
end
