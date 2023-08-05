class FoodInventoriesController < ApplicationController
  def index
    @food_inventories = FoodInventory.all
  end

  def new
    @food_inventory = FoodInventory.new
    @inventory = Inventory.find(params[:inventory_id])
  end

  def create
    @food_inventory = FoodInventory.new(food_inventory_params)
    @inventory = Inventory.find(params[:inventory_id])
    @food_inventory.inventory = @inventory

    if @food_inventory.save
      redirect_to user_inventory_path(current_user, @inventory), notice: 'Food inventory was created successfully.'
    else
      render 'new'
    end
  end

  def destroy
    @food_inventory = FoodInventory.find(params[:id])
    @inventory = @food_inventory.inventory
    if @food_inventory.destroy
      redirect_to user_inventory_path, notice: 'Inventory was destroyed'
    else
      redirect_to user_inventory_path, alert: 'Inventory was not deleted'
    end
  end

  private

  def food_inventory_params
    params.require(:food_inventory).permit(:food_id, :inventory_id, :quantity)
  end
end
