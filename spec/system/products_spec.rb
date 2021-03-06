require 'rails_helper'

RSpec.describe Product, type: :system do
  let(:user) { create(:user, :with_products) }

  context '作品一覧機能' do
    before do
      sign_in_as user
      visit products_path
    end

    it '作成した作品が表示されている' do
      aggregate_failures do
        expect(page).to have_current_path products_path, ignore_query: true
        expect(page).to have_content user.products[0].name.to_s
        expect(page).to have_content user.products[1].name.to_s
        expect(page).to have_content user.products[2].name.to_s
        expect(page).to have_content 'Lorem'
      end
    end
  end
end
