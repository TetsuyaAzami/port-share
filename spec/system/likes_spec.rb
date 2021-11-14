# require 'rails_helper'

# RSpec.describe 'Likes', type: :system do
#   let(:user) { create(:user) }
#   let(:product) { create(:product) }

#   describe '#create,#destroy' do
#     before do
#       # ログイン
#       sign_in_as user
#     end

#     it 'ユーザーが他の投稿をいいね、いいね解除できる',js: true do
#       # productのshowページに遷移
#       visit product_path(product)

#       # いいねをするボタンを押す
#       find('#heart-gray').click
#       expect(page).to have_selector '#heart-gray'
# 	  # binding.pry上ではproduct.likes.countが1になっているが、0として帰ってくる。謎。
#       expect(product.likes.count).to eq(1)

#       # いいねを解除する
#       find('#heart-red').click
#       expect(page).to have_selector '#heart-red'
#       expect(product.likes.count).to eq(0)
#     end
#   end
# end
