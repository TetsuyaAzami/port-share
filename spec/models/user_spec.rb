require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) do
    User.new(name: '哲也', email: 'tetuya@email.com', password: 'password')
  end
  context '名前が入力されている場合' do
    it 'ユーザー登録が成功すること' do
      expect(user).to be_valid
    end
  end

  context '名前が空の場合' do
    it 'ユーザー登録が成功しないこと' do
      user.name = ''
      user.valid?
      expect(user.errors[:name]).to include('を入力してください。')
    end
  end

  context 'userが削除された場合' do
    it '削除されたuserのproductが削除されること' do
      user.save
      user.products.create(name: 'ポートフォリオ1', technique: 'Ruby')
      expect { user.destroy }.to change { Product.count }.by(-1)
    end
  end
end
