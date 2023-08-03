class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
    @my_recipes = Recipe.where(user_id: current_user.id)
    @recipe_food = RecipeFood.all
    @this_recipe = RecipeFood.where(recipe_id: @recipe)
    @food = Food.all
  end

  def show
    @recipes = Recipe.find(params[:id])
    @recipe_food = RecipeFood.all
    @actual_user = current_user
    @food = Food.all
    @recipe_id = @recipe.id
    @notice = params[:notice] if params[:notice]
    return unless params[:alert]

    @alert = params[:alert]
  end

  def new
    @recipes = Recipe.new
  end

  def create
    @recipes = Recipe.new(recipe_params)
    if @recipes.save
      redirect_to recipes_path, notice: 'Recipe was successfully created.'
    else
      redirect_to new_recipe_path(current_user.id, @recipe.id), alert: 'Recipe was not created.'
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

  def shopping_list


    @recipes = Recipe.where(user_id: current_user.id)
    @recipe_food = []  # Initialize the hash as an empty hash
    @ingredient = []

    @recipes.each do |recipe|
      @recipe_food = RecipeFood.where(recipe_id: recipe.id)
      @ingredient += Food.where(id: @recipe_food.pluck(:food_id))
    end

    @inventory = Inventory.where(user_id: current_user.id)
    @food_inventory = []
    @inventory_ingredient = []

    @inventory.each do |inventory|
      @food_inventory = FoodInventory.where(inventory_id: inventory.id)
      @inventory_ingredient += Food.where(id: @food_inventory.pluck(:food_id))
    end
    
    @food = Food.all

  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public, :user_id)
  end
end
