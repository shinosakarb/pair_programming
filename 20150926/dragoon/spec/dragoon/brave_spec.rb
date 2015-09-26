require 'spec_helper'

describe Dragoon::Brave do
  describe ".name" do
    example "dragoon?" do
      expect(Dragoon::Brave.new.name).to eq "dragoon"
    end
  end
end
