require 'spec_helper'

describe Dqx::Hero do
  describe "#attack" do
    before do
      @hero = Dqx::Hero.new(:level => 1, :attack_power => 4, :defence_power => 4, \
                      :hit_point => 15, :magic_power => 0, :experience_point => 0)
      @scarecrow = Dqx::Monster.new(:name => "カカシ", :attack_power => 0, :defence_power => 1, \
                          :hit_point => 100, :experience_point => 1)
    end
    
    context '勇者の攻撃力が10、乱数値が128で通常攻撃のとき'
    it '7ダメージを与えること' do
      @hero.attack_power = 10
      @hero.stub(:critical?).and_return(false)
      Random.stub(:rand).and_return(128)

      expect( @hero.attack(@scarecrow) ).to eq 7
    end

    context '勇者の攻撃力が10、乱数値が100で会心の一撃のとき'
    it '8ダメージを与えること' do
      @hero.attack_power = 10
      @hero.stub(:critical?).and_return(true)
      Random.stub(:rand).and_return(128)

      expect( @hero.attack(@scarecrow) ).to eq 8
    end
  end
end
