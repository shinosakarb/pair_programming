module Dragoon
  module Character
    class Monsters_property
      def initialize(name)
        @name = name
        case @name

        when "スライム"
          @attack = 5
          @defense = 3
          @hit_point = 3
          @exprience_point = 1
        end
        
      end

      def name
        @name
      end

      # 攻撃力
      def attack
        @attack
      end

      #守備力
      def defense
        @defense
      end

      # HP
      def hit_point
        @hit_point
      end

      def hit_point= (val)
        @hit_point = val
      end

      #EXP
      def experience_point
        @experience_point
      end
    end
  end
end
