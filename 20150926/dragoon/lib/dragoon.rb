require "dragoon/version"

module Dragoon
  # Your code goes here...

  class Main
    class << self
      def start
        puts "王様に呼ばれた勇者が、ドラゴンを倒した。"

        print "勇者の名前 > "
        stdin = STDIN.gets.chomp.to_s
        puts "勇者 #{stdin} !"

        puts "- 完 -"
      end
    end
  end
end
