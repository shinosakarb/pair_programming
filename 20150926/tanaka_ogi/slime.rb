class Slime
  attr_reader :attack, :defence, :experience_point
  attr_accessor :hit_point

  def initialize
    @attack =5
    @defence = 3
    @hit_point = 3
    @experience_point = 1
  end
end