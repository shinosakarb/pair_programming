require './vending_machine'

describe VendingMachine do

  it(:vending_machine) { VendingMachine.new }

  describe '商品を選択' do
    describe '#select' do
      it '0番目が選択された時はオレンジジュースを取得する' do
        drink = vending_machine.select(0)
        expect(drink).to eq()
      end
    end
  end

  describe '金額を入力' do
    describe '#put_coins' do
    end
  end
end
