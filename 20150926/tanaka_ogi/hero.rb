class Hero
  attr_reader :level, :attack, :defence
  attr_accessor :hit_point, :magic_power

  def initialize
    @level = 1
    @attack = 4
    @defence = 4
    @hit_point = 15
    @magic_poer = 0
  end
end

