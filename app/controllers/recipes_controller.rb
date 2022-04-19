class RecipesController < ApplicationController
  def index
    redirect_to public_recipes_path unless current_user

    @recipes = current_user.recipes
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    redirect_to public_recipes_path unless current_user

    recipe = Recipe.new(recipe_params)

    if recipe.save
      redirect_to recipe_path(recipe.id), notice: 'recipe was successfully created!'
    else
      redirect_to new_recipe_path, notice: 'recipe could not be created!'
    end
  end
  
  def destroy
    recipe = Recipe.find(params[:id])
    recipe.destroy!
    redirect_to recipes_path, notice: "Recipe #{recipe.name} deleted successfully!"
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :user_id, :preparation_time, :cooking_time, :description, :public)
  end
end
