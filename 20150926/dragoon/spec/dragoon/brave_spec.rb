require 'spec_helper'

describe Dragoon::Brave do
  describe "level" do
    let(:brave) {Dragoon::Brave.new("dragoon")}

    example "level 1" do
      expect(brave.name).to eq "dragoon"
      expect(brave.level).to eq 1
      expect(brave.attack).to eq 4
      expect(brave.defense).to eq 4
      expect(brave.hit_point).to eq 15
      expect(brave.magic_power).to eq 0
    end
  end
end
