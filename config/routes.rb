Rails.application.routes.draw do
  devise_for :users,
             controllers: {
               sessions: 'users/sessions',
               registrations: 'users/registrations'
             }
  root 'homes#top'
  resources :products do
    resources :product_techniques, only: [:create]
  end
  get '/products_favor', to: 'products#index'
  get '/products_search_by_language', to: 'products#index'

  resources :users, only: %i[show edit update destroy]

  post 'like/:id' => 'likes#create', :as => 'create_like'
  delete 'like/:id' => 'likes#destroy', :as => 'destroy_like'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
