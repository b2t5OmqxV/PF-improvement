class Users::AppliancesController < ApplicationController
  def top
    @categories = Categorie.all
    @notices = Notice.all
    @appliances = Appliance.all.order(created_at: :desc)
  end

  def new
    @appliance = Appliance.new
  end

  def create
    @appliance_new = Appliance.new(appliance_params)
    @appliance_new.user = current_user
    logger.debug @appliance_new.errors.inspect
    if @appliance_new.save
      redirect_to appliance_path(id: @appliance_new.id)
    else
      render action: :new
    end
  end

  def index
    @categories = Categorie.all
    @notices = Notice.all
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
    @appliance.user = current_user
    if @appliance.update
      redirect_to appliance_path(id: @appliance)
    else
      render action: :edit
    end
  end

  def destroy
    @appliance = Appliance.find(params[:id])
    @appliance.destroy
    redirect_to appliance_path(id: @appliance)
  end

  private

  def appliance_params
    params.require(:appliance).permit(:user_id, :category_id, :maker, :image, :product, :model, :purchase_amount, :purchase_day, :warranty_period, :start_operation, :place, :frequency, :detail)
  end
end
