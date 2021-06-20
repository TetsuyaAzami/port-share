require 'rails_helper'

RSpec.describe User, type: :system do
  subject(:user) { create(:user) }
  it 'ログインができる' do
    sign_in_as user
    expect(current_path).to eq products_path
    expect(page).to have_content 'ログインしました。'
  end
end
