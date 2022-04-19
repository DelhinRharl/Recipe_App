Rails.application.routes.draw do
  
  resources :foods, only: [:index, :create, :new]
  resources :recipes, only: [:index, :show]
  resources :public_recipes, only: [:index]
  resources :general_shopping_list, only: [:index]
  root "foods#index"
end
