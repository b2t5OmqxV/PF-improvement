class Admins::AppliancesController < ApplicationController
  def index
    @categories = Category.all
    @users = User.all
    if params[:id]
      @category = Category.find(params[:id])
      @appliances = @category.appliances.all
    else
      @appliances = Appliance.all
    end
  end

  def show
    @appliance = Appliance.find(params[:id])
  end

  def edit
    @appliance = Appliance.find(params[:id])
  end

  def update
    @appliance = Appliance.find(params[:id])
    @appliance.useful_life = @appliance.after_month
    if @appliance.update(appliance_params)
      redirect_to admins_appliance_path(@appliance.id)
    else
      render action: :edit
    end
  end

  def destroy
    @appliance = Appliance.find(params[:id])
    @appliance.destroy
    redirect_to admins_appliances_path
  end

  private

  def appliance_params
    params.require(:appliance).permit(:user_id, :category_id, :maker, :image, :product, :model, :purchase_amount, :purchase_day, :warranty_period, :start_operation, :useful_life, :place, :frequency, :detail)
  end

  def appliance_after_month
    appliance_params.merge(@appliance_new.after_month)
  end
end
