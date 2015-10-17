require 'spec_helper'

describe Dragoon::Character::Monster do
  describe "level" do
    let(:brave) {Dragoon::Character::Monster.new("dragoon")}

    example "level 1" do
      expect(brave.name).to eq "dragoon"
    end
  end
end
