class FoodsController < ApplicationController
  def index
    @foods = Food.all
  end

  def new
    @food = Food.new
  end

  def create
    @food = current_user.foods.new(food_params)
    if @food.save
      redirect_to foods_path, notice: 'You have added a new food!'
    else
      redirect_to foods_path, notice: 'Food not saved!'
    end
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy!
    flash[:notice] = 'You have deleted the food!'
    redirect_to food_path
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price)
  end
end
