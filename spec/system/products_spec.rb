require 'rails_helper'

RSpec.describe Product ,type: :system do
  let(:user){
    create(:user,:with_products)
  }
  # context '作品一覧機能' do
  #   before do
  #     sign_in user
  #     visit products_path
  #   end
  #   it '作成した作品が表示されている' do

  #   product.save
  #   expect(page).to have_content 'Portfolio-1'
  #   expect(page).to have_content 'Portfolio-2'
  #   expect(page).to have_content 'Portfolio-3'
  #   expect(page).to have_content 'Lorem'
  #   end

  # end

end
