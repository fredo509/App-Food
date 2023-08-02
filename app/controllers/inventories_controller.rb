class InventoriesController < ApplicationController
    
    def index
        @inventories = Inventory.all
    end

    def show
        @inventory = Inventory.find(params[:id])
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
