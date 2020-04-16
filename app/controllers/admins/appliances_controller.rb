class Admins::AppliancesController < ApplicationController
  def index
    @categories = Categorie.all
    @users = User.all
    @appliances = Appliance.all
  end

  def show
    @appliance = Appliance.find(params[:id])
  end

  def edit
    @appliance = Appliance.find(params[:id])
  end

  def update
    @appliance = Appliance.find(params[:id])
    @appliance.update
    redirect_to admins_appliance_path(@appliance.id)
  end

  def destroy
    @appliance = Appliance.find(params[:id])
    @appliance.destroy
    redirect_to appliance_path(@appliance.id)
  end

  private

  def appliance_params
    params.require(:appliance).permit(:user_id, :category_id, :maker, :image, :product, :model, :purchase_amount, :purchase_day, :warranty_period, :start_operation, :place, :frequency, :detail)
  end
end
