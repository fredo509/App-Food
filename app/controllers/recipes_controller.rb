class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
    @my_recipes = Recipe.where(user_id: current_user.id)
    @recipe_food = RecipeFood.all
    @food = Food.all
  end

  def show
    @recipes = Recipe.find(params[:id])
    @recipe_food = RecipeFood.all
    @food = Food.all
  end

  def new
    @recipes = Recipe.new
  end

  def create
    @recipes = Recipe.new(recipe_params)
    if @recipes.save
      redirect_to recipes_path, notice: 'Recipe was successfully created.'
    else
      redirect_to new_recipe_path, alert: 'Recipe was not created.'
    end
  end

  def destroy
    @recipes = Recipe.find(params[:id])
    if @recipes.destroy
      redirect_to recipes_path, notice: 'Recipe was successfully destroyed.'
    else
      redirect_to recipes_path, alert: 'Recipe was not destroyed.'
    end
  end

  def public_recipes
    @public_recipes = Recipe.where(public: true)
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public, :user_id)
  end
end
