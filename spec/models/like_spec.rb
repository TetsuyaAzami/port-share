require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:like) { build(:like) }

  describe '正常値と異常値の確認' do
    context 'likeモデルのバリデーション' do
      it 'user_idとproduct_idがあれば保存できる' do
        expect(like).to be_valid
      end

      it 'user_idがないと保存に失敗すること' do
        like.user_id = nil
        like.valid?
        expect(like.errors[:user_id]).to include('を入力してください')
      end

      it 'product_idがないと保存に失敗すること' do
        like.product_id = nil
        like.valid?
        expect(like.errors[:product_id]).to include('を入力してください')
      end
    end
  end
end
