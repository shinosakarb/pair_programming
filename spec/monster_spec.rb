require 'spec_helper'
require_relative '../draque'

# クラス名をかく
describe Monster do
  it 'アタック' do
    hero = Hero.new
    monster = Monster.new
    puts monster.attack(hero)
    expect(monster.attack(hero)).to be_a_kind_of(Integer)
  end
end