require 'spec_helper'

describe Dragoon::Character::Brave do
  describe "level" do
    let(:brave) {Dragoon::Character::Brave.new("dragoon")}

    example "level 1" do
      expect(brave.name).to eq "dragoon"
    end
  end
end
