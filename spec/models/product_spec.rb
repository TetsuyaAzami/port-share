require 'rails_helper'

RSpec.describe Product, type: :model do
  subject!(:product){create(:product)}
  let(:user) { product.user }

  context 'Productが削除された場合' do
    it '関連する中間テーブルも削除されること' do
      expect{product.destroy}.to change { ProductTechnique.count }.by(-1)
    end
  end

  context '名前が空である場合' do
    it 'productが登録されないこと' do
      product.name = ''
      product.valid?
      expect(product.errors[:name]).to include("を入力してください。")
    end
  end

  context '名前が入力されている場合' do
    it 'productの登録に成功すること' do
      expect(product).to be_valid
    end
  end

  context '名前が51文字以上である場合' do
    it '保存に失敗すること' do
     product.name = "a" * 51
     product.valid?
     expect(product.errors[:name]).to include("は50文字以内にしてください。")
    end
  end

  context '名前が51文字以上である場合' do
    it '保存に失敗すること' do
     product.name = "a" * 51
     product.valid?
     expect(product.errors[:name]).to include("は50文字以内にしてください。")
    end
  end

  context 'descriptionが251文字以上である場合' do
    it '保存に失敗すること' do
     product.description = "a" * 251
     product.valid?
     expect(product.errors[:description]).to include("は250文字以内にしてください。")
    end
  end

end
