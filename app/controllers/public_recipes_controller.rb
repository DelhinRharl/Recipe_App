class PublicRecipesController < ApplicationController
  def index
    @recipes = Recipe.where(public: true).map do |recipe|
      {
        name: recipe.name,
        user: recipe.user.name,
        food_items: recipe.foods.count,
        total_price: recipe.foods.sum(:price)
      }
    end
  end
end
