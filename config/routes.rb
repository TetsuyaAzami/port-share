Rails.application.routes.draw do
  devise_for :users,controllers: { sessions: 'users/sessions',
    registrations: 'users/registrations'
   }
  root "homes#top"
  resources :products do
    resources :product_techniques,only:[:create]
  end
  resources :users, only: [:show, :edit,:update,:destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
