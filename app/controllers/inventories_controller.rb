class InventoriesController < ApplicationController
    
    def index
        @inventories = Inventory.all
    end

    def show
        @inventory = Inventory.find(params[:id])
        # @inventory_food_name = @inventory.food_inventory.name
        # @inventory_food_quantity = @inventory.food_inventory.quantity

    end


    def destroy
        @inventory = Inventory.find(params[:id])
        if @inventory.destroy 
          redirect_to inventories_path, notice: 'Inventory was destroyed' 
        else
          redirect_to inventories_path, alert: 'Inventory was not deleted' 
        end
      end
end
