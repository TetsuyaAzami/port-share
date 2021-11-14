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

      it '同一のuserが同一のproductに複数のlikeができないこと' do
        like.save
        dupulicate_like =
          described_class.new(
            user_id: like.user_id,
            product_id: like.product_id
          )
        dupulicate_like.valid?
        expect(dupulicate_like.errors[:user_id]).to include(
          'は既にいいねをしています'
        )
        expect(dupulicate_like.errors[:product_id]).to include(
          'は既にいいねをしています'
        )
      end

      it '異なるuserが同一のproductに対してlikeできること' do
        like.save
        user = create(:user)
        new_like =
          described_class.new(user_id: user.id, product_id: like.product_id)
        expect(new_like).to be_valid
      end
    end
  end
end
