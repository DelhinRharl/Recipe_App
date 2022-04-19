Rails.application.routes.draw do
  
  resources :foods, only: [:index, :create, :new, :destroy]
  devise_for :users
  get '/foods', to: 'foods#index', as: 'user_root'
  resources :recipes, only: [:index, :show, :new, :create, :destroy]
  resources :public_recipes, only: [:index]
  resources :general_shopping_list, only: [:index]
  root "foods#index"
end
