require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { build(:user) }
  context '名前,email,passwordが全て入力されている場合' do
    it 'ユーザー登録が成功すること' do
      expect(user).to be_valid
    end
  end

  context '名前が空の場合' do
    it 'ユーザー登録が成功しないこと' do
      user.name = ''
      user.save
      expect(user.errors[:name]).to include('を入力してください。')
    end
  end

  context 'emailが空の場合' do
    it 'ユーザー登録が成功しないこと' do
      user.email = ''
      user.save
      expect(user.errors[:email]).to include('を入力してください。')
    end
  end

  context 'passwordが空の場合' do
    it 'ユーザー登録が成功しないこと' do
      user.password = ''
      user.save
      expect(user.errors[:password]).to include('を入力してください。')
    end
  end

  context 'userが削除された場合' do
    it '削除されたuserのproductが削除されること' do
      product = create(:product)
      expect { product.user.destroy }.to change { Product.count }.by(-1)
    end
  end
end
