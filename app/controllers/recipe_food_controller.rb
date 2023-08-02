class RecipeFoodController < ApplicationController



    def index
        @recipe_food = RecipeFood.all
    end

def new
  @recipe_food = RecipeFood.new
  @recipe_id = params[:recipe_id]  # Corrected from Recipe.find(params[:recipe_id])
end


def create
  @recipe_food = RecipeFood.new(recipe_food_params)
  puts @recipe_food.inspect
  if @recipe_food.save
    redirect_to recipe_path(current_user.id, @recipe_food.id), notice: 'Recipe Food was successfully created.'
  else
    puts @recipe_food.errors.full_messages  # Display validation errors in the console
    render :new
  end
end

    def destroy
        @recipe_food = RecipeFood.find(params[:id])
        if @recipe_food.destroy
            redirect_to recipe_path(current_user.id, @recipe_food.id), notice: 'The ingredient was successfully created.'
        else
            redirect_to recipes_path, alert: 'Recipe Food was not destroyed.'
        end
    end

    private 

    # the parametters are: quantity, recipe_id, food_id
    def recipe_food_params
        params.require(:recipe_food).permit(:quantity, :recipe_id, :food_id)
    end

end
