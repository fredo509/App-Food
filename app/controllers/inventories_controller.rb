class InventoriesController < ApplicationController
  
    def index
      @inventories = current_user.inventories
    end
  
    def show
      @inventory = Inventory.find(params[:id])
      @inventory_food_inventories = @inventory.food_inventory
    end
  
    def new
      @inventory = Inventory.new
    end
  
    def create
      @inventory = current_user.inventories.new(inventory_params)
  
      if @inventory.save
        redirect_to inventories_path, notice: 'Inventory was successfully created.'
      else
        render :new
      end
    end
  
    def destroy
      @inventory = Inventory.find(params[:id])
      if @inventory.destroy
        redirect_to inventories_path, notice: 'Inventory was destroyed.'
      else
        redirect_to inventories_path, alert: 'Inventory was not deleted.'
      end
    end
  
    private
  
    def inventory_params
      params.require(:inventory).permit(:name)
    end
  end
  