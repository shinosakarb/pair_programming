module Dragoon
  module Character
    class Monster
      def initialize(name)
        @name = name
      end

      def property
        @property ||= Dragoon::Character::Monsters_property.new(@name)
      end

      def name
        property.name
      end

      # HP
      def current_hit_point
        property.hit_point
      end

      def current_hit_point= (val)
        property.hit_point = val
      end

      # MP
      def current_magic_power
        property.magic_power
      end
    end
  end
end


