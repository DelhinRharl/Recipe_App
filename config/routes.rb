Rails.application.routes.draw do
  
  resources :foods, only: [:index, :create, :new, :destroy]
  devise_for :users
  get '/foods', to: 'foods#index', as: 'user_root'
  get '/foods', to: 'foods#index', as: 'user'
  # Defines the root path route ("/")
  resources :foods, only: [:index, :show, :new, :create, :destroy]
  resources :recipes, only: [:index, :show, :new, :create, :destroy] do
    resources :recipe_foods, only: [:new, :create, :edit, :update, :destroy]
  end
  resources :public_recipes, only: [:index]
  resources :general_shopping_list, only: [:index]
  root "foods#index"
end
