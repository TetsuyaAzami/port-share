require 'rails_helper'

RSpec.describe 'Access to static_pages', type: :request do
  let(:user) { create(:user, :with_products) }

  context 'when GET #root' do
    before do
      sign_in user
      get root_path
    end

    it 'responds successfully' do
      expect(response).to have_http_status :ok
    end

    it "has title 'Port-Share'" do
      expect(response.body).to include 'Port-Share'
    end

    it "has not title '| Port-Share'" do
      expect(response.body).not_to include '| Port-Share'
    end
  end

  context 'when GET sessions#new' do
    before { get new_user_session_path }

    it 'responds successfully' do
      expect(response).to have_http_status :ok
    end

    it "has title 'Sign in | Port-Share'" do
      expect(response.body).to include 'Sign in | Port-Share'
    end
  end

  context 'when GET registrations#new' do
    before { get new_user_registration_path }

    it 'responds successfully' do
      expect(response).to have_http_status :ok
    end

    it "has title 'Sign up | Port-Share'" do
      expect(response.body).to include 'Sign up | Port-Share'
    end
  end

  context 'when GET product#index' do
    before do
      sign_in user
      get products_path
    end

    it 'responds successfully' do
      expect(response).to have_http_status :ok
    end

    it "has title '作品一覧 | Port-Share'" do
      expect(response.body).to include '作品一覧 | Port-Share'
    end
  end

  context 'when GET products#new' do
    before do
      sign_in user
      get new_product_path
    end

    it 'responds successfully' do
      expect(response).to have_http_status :ok
    end

    it "has title '作品の登録 | Port-Share'" do
      expect(response.body).to include '作品の登録 | Port-Share'
    end
  end

  context 'when GET products#show' do
    before do
      sign_in user
      get product_path(Product.pluck(:id)[0])
    end

    it 'responds successfully' do
      expect(response).to have_http_status :ok
    end

    it "has title '作品詳細 | Port-Share'" do
      expect(response.body).to include '作品詳細 | Port-Share'
    end
  end

  context 'when GET products#edit' do
    before do
      sign_in user
      get edit_product_path(user.products.pluck(:id)[0])
    end

    it 'responds successfully' do
      expect(response).to have_http_status :ok
    end

    it "has title '作品詳細 | Port-Share'" do
      expect(response.body).to include '作品の編集 | Port-Share'
    end
  end

  context 'when GET users#show' do
    before do
      sign_in user
      get user_path(user.id)
    end

    it 'responds successfully' do
      expect(response).to have_http_status :ok
    end

    it "has title '作品詳細 | Port-Share'" do
      expect(response.body).to include "#{user.name} | Port-Share"
    end
  end
end
