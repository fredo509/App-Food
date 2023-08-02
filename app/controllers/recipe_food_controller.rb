class RecipeFoodController < ApplicationController

    def new
        @recipe_food = RecipeFood.new
    end

    def index
        @recipe_food = RecipeFood.all
    end

    def create
        @recipe_food = RecipeFood.new(recipe_food_params)
        if @recipe_food.save
            redirect_to recipes_path, notice: 'Recipe Food was successfully created.'
        else
            redirect_to new_recipe_food_path, alert: 'Recipe Food was not created.'
        end
    end

    def destroy
        @recipe_food = RecipeFood.find(params[:id])
        if @recipe_food.destroy
            redirect_to recipes_path, notice: 'Recipe Food was successfully destroyed.'
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
