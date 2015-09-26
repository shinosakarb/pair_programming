require 'spec_helper'
require_relative '../draque'

# クラス名をかく
describe Hero do
  # it '攻撃が数値であること' do
  #   hero = Hero.new
  #   monster = Monster.new
  #   expect(hero.attack(monster)).to be_a_kind_of(Integer)
  # end
  
  it 'ノーマルアタック' do
    hero = Hero.new
    monster = Monster.new
    expect(hero.normal_attack(monster)).to be >= 1
  end

  it 'クリティカルヒット' do
    hero = Hero.new
    expect(hero.critical_hit).to be >= 2
  end

end