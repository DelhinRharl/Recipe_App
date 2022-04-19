class RecipeFoodsController < ApplicationController
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = RecipeFood.new
    @foods = current_user.foods
  end

  def create
    recipe_food = RecipeFood.new(recipe_food_params)

    if recipe_food.save
      redirect_to recipe_path(recipe_food.recipe_id), notice: 'Ingredient was added successfully!'
    else
      flash[:alert] = "Failed creating ingredient"
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
  end

  private

  def recipe_food_params
    params.require(:recipe_food).permit(:recipe_id, :food_id)
  end
end
