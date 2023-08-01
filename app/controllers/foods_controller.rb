class FoodsController < ApplicationController
  def index
    @foods = Food.all
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)

    if @food.save
      redirect_to foods_path
    else
      render 'new'
    end
  end

  def destroy
    @foods = Food.find(params[:id])
    if @foods.destroy
      redirect_to foods_path, notice: 'foods was destroyed'
    else
      redirect_to foods_path, alert: 'foods was not deleted'
    end
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price)
  end
end
