class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
    @my_recipes = Recipe.where(user_id: current_user.id).page(params[:page]).per(3)
    @recipe_food = RecipeFood.all
    @this_recipe = RecipeFood.where(recipe_id: @recipe)
    @food = Food.all
  end

  def show
    @recipe = Recipe.find(params[:id])
    @recipe_food = RecipeFood.includes(:food).where(recipe_id: @recipe.id).page(params[:page]).per(3)
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

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      redirect_to @recipe, notice: 'Recipe was successfully updated.'
    else
      puts @recipe.errors.full_messages # Print errors to the console
      render :show, alert: 'Something went wrong'
    end
  end

  def public_recipes
    @public_recipes = Recipe.where(public: true).page(params[:page]).per(3)
  end

  def shopping_list(inventory_id = nil)
    @recipe = Recipe.find(params[:recipe_id])
    @recipes = Recipe.where(user_id: current_user.id)
    @recipe_food = RecipeFood.where(recipe_id: @recipes.pluck(:id))
    @ingredient = Food.where(id: @recipe_food.pluck(:food_id))

    @inventory = if inventory_id
                   Inventory.includes([:food]).where(id: inventory_id)
                 else
                   Inventory.where(user_id: current_user.id)
                 end

    @food_inventory = FoodInventory.where(inventory_id: @inventory.pluck(:id))
    @inventory_ingredient = Food.where(id: @food_inventory.pluck(:food_id))

    @food = Food.all
  end



  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public, :user_id)
  end
end
