require 'spec_helper'

describe Dragoon::Battle do
  describe "#start" do
    let(:brave) {Dragoon::Character::Brave.new("dragoon")}
    let(:monster) {Dragoon::Character::Monster.new("スライム")}

    before do
      battle = Dragoon::Battle.new(brave, monster)
      allow(battle).to receive(:gets).and_return(*%w[1 1 2])
      @after_brave = battle.start
    end

    example "brave" do
      expect(@after_brave.current_hit_point).to be_between(9, 15)
      expect(@after_brave.current_magic_power).to eq 0
      expect(monster.current_hit_point).to be_between(0, 1)
    end
  end
end
