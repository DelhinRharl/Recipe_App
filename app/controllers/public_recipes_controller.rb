class PublicRecipesController < ApplicationController
  def index
    @recipes = Recipe.where(public: true).each do |recipe|
      {
        food_items: recipe.foods.count,
        total_price: recipe.foods.map.sum(:price)
      }
    end
  end
end
