require File.expand_path('../battle_system', File.dirname(__FILE__))
require File.expand_path('../hero', File.dirname(__FILE__))
require File.expand_path('../slime', File.dirname(__FILE__))

describe BattleSystem do
  describe '#attack' do
    #let(:hero) { Hero.new }
    #let(:monster) { Hero.new }
    #let!(:battle_system) { BattleSysmte.new(hero, monter) }

    context '通常の攻撃' do
      context '勇者の攻撃力－敵の守備力／２ < 2の場合' do
        let(:hero) { Hero.new.tap {|h| h.instance_variable_set(:@attack, 2) }}
        let(:monster) { Slime.new.tap {|m| m.instance_variable_set(:@defence, 2) } }
        let!(:battle_system) { BattleSystem.new(hero, monster) }

        it 'モンスターのHPが１〜2減る' do
          allow_any_instance_of(Array).to receive(:sample).with(any_args).and_return(1)
          #allow_any_instance_of(Kernel).to receive(:rand).with(any_args).and_return(3)

          expect {
            battle_system.attack
          }.to change{monster.hit_point}.by(-1)
        end
      end
      context '勇者の攻撃力－敵の守備力／２ >= 2の場合' do

      end
    end
  end
end