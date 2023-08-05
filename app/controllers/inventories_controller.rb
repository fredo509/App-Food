class InventoriesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @inventories = Inventory.includes(:user).where(user_id: current_user.id).page(params[:page]).per(3)
  end

  def show
    @inventory = Inventory.find(params[:id])
    @inventory_food_inventories = @inventory.food_inventories.includes(:food).page(params[:page]).per(3)
    @food = Food.all
  end

  def new
    @user = User.find(params[:user_id])
    @inventory = @user.inventories.new
  end

  def create
    @user = User.find(params[:user_id])
    @inventory = @user.inventories.new(inventory_params)

    if @inventory.save
      redirect_to user_inventories_path(@user), notice: 'Inventory was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @inventory = Inventory.find(params[:id])

    if @inventory.destroy
      redirect_to user_inventories_path(@inventory.user), notice: 'Inventory was destroyed.'
    else
      redirect_to user_inventories_path(@inventory.user), alert: 'Inventory was not deleted.'
    end
  end

  private

  def inventory_params
    params.require(:inventory).permit(:name, :description)
  end
end
