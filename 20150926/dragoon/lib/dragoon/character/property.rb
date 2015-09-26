module Dragoon
  module Character
    class Property
      def initialize(name)
        @name = name
        @level = 1
        @attack = 4
        @defense = 4
        @hit_point = 15
        @magic_power = 0
      end

      def name
        @name
      end

      def level
        @level
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

      # MP
      def magic_power
        @magic_power
      end
    end
  end
end
