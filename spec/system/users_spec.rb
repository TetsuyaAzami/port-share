require 'rails_helper'

RSpec.describe User, type: :system do
  subject(:user) { create(:user) }

  it 'ログインができる' do
    aggregate_failures do
      sign_in_as user
      expect(page).to have_current_path products_path, ignore_query: true
      expect(page).to have_content 'ログインしました。'
    end
  end
end
