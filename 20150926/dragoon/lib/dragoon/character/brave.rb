# Dragoon::Character::Brave.new
module Dragoon
  module Character
    class Brave
      def initialize(name)
        @name = name
      end

      def property
        @property ||= Dragoon::Character::Property.new(@name)
      end

      def name
        property.name
      end

      # HP
      def current_hit_point
        property.hit_point
      end

      # MP
      def current_magic_power
        property.magic_power
      end
    end
  end
end
