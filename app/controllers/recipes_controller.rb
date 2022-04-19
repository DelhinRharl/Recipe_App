class RecipesController < ApplicationController
  def index
    redirect_to public_recipes_path unless current_user

    @recipes = Recipe.all
  end

  def show 
    @recipe = Recipe.find(params[:id])
  end
  
  def destroy
    recipe = Recipe.find(params[:id])
    recipe.destroy!
    redirect_to recipes_path, notice: "Recipe #{recipe.name} deleted successfully!"
  end
end
