require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:user) { User.new(name: 'tetu', email: 'tetuy@email') }
  subject(:product) do
    user.products.new(name: 'ポートフォリオ1', technique: 'Ruby')
  end
  # context 'Productが削除された場合' do
  #   it '関連する中間テーブルも削除されること' do

  #     expect { product.destroy }.to change { ProductTechnique.count }.by(-1)
  #   end
  # end

  context '名前が空である場合' do
    it 'productが登録されないこと' do
      product.name = ''
      expect(product).not_to be_valid
    end
  end

  context 'techniqueが空である場合' do
    it 'ptoductが登録されないこと' do
      product.technique = ''
      expect(product).not_to be_valid
    end
  end
end
