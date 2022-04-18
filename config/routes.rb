Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get '/foods', to: 'foods#index', as: 'user_root'
  # Defines the root path route ("/")
  resources :foods, only: [:index]
  resources :recipes, only: [:index, :show]
  resources :public_recipes, only: [:index]
  resources :general_shopping_list, only: [:index]
  root "foods#index"
end
