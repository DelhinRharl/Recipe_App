class GeneralShoppingListController < ApplicationController
  def index
    @recipe_foods = RecipeFood.all
  end
end
