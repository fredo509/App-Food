class RecipeFoodController < ApplicationController
  def index
    @recipe_food = RecipeFood.all
  end

  def new
    @recipe_food = RecipeFood.new
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food.recipe = @recipe
    @ability = Ability.new(current_user)
  end

  def update
    @recipe_food = RecipeFood.find(params[:id])
    @recipe_id = params[:recipe_id]
    if @recipe_food.update(recipe_food_params)
      redirect_to recipe_path(@recipe_id), notice: 'The ingredient was successfully updated.'
    else
      redirect_to recipe_path(@recipe_id), alert: 'The ingredient could not be updated.'
    end
  end

  def create
    @recipe_id = params[:recipe_id]
    @recipe_food = RecipeFood.new(recipe_food_params)
    if @recipe_food.save
      redirect_to recipe_path(@recipe_id), notice: 'Recipe Food was successfully created.'
    else
      redirect_to recipe_path(@recipe_id), alert: 'Recipe Food was not created.'
    end
  end

  def edit
    @recipe_food = RecipeFood.find(params[:id])
    @recipe = Recipe.find(params[:recipe_id])
  end

  def destroy
    @recipe_food = RecipeFood.find(params[:id])
    @recipe_id = params[:recipe_id]
    if @recipe_food.destroy
      redirect_to recipe_path(@recipe_id), notice: 'The ingredient was successfully created.'
    else
      redirect_to recipe_path(@recipe_id), alert: 'Recipe Food was not destroyed.'
    end
  end

  private

  # the parametters are: quantity, recipe_id, food_id
  def recipe_food_params
    params.require(:recipe_food).permit(:quantity, :recipe_id, :food_id)
  end
end
