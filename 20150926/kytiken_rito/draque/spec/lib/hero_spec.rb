require 'spec_helper'
require 'draque/hero'

describe Hero do
  let(:hero) {Hero.new}
  describe '#action_list' do
    example 'コマンドリストが取得できること' do
      expect(hero.action_list).to match([[1, 'たたかう'],[2, 'にげる']])
    end
  end

  describe '#action' do
    context 'IDがコマンドリストにない場合' do
      example '空文字が返ってくること' do
        expect(hero.action(99)).to eq ''
      end
    end
    context 'IDがコマンドリストにある場合' do
      context '逃げるが選択された場合' do
        example 'nilが返ってくること' do
          expect(hero.action(2)).to be_nil
        end
      end
      context '逃げる以外が選択された場合' do
        example '文字列が返ってくること' do
          expect(hero.action(1)).not_to be_nil
          expect(hero.action(1)).not_to eq ''
        end
      end
    end
  end
end
