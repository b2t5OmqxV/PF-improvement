class Users::AppliancesController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: %i[edit update]
  def top
    @categories = Category.all
    @notices = Notice.all
    @appliances = Appliance.all.order(created_at: :desc)
  end

  def new
    @categories = Category.all
    @appliance_new = Appliance.new
  end

  def create
    @appliance_new = Appliance.new(appliance_params)
    @appliance_new.user = current_user
    @appliance_new.useful_life = @appliance_new.after_month
    if @appliance_new.save
      redirect_to appliance_path(@appliance_new.id)
    else
      render action: :new
    end
  end

  def index
    @categories = Category.all
    @notices = Notice.all
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
    @appliance.user = current_user
    @appliance.useful_life = @appliance.after_month
    if @appliance.update(appliance_params)
      redirect_to appliance_path(@appliance.id)
    else
      render action: :edit
    end
  end

  def destroy
    @appliance = Appliance.find(params[:id])
    @appliance.destroy
    redirect_to appliances_path
  end

  private

  def correct_user
    @appliance = Appliance.find(params[:id])
    @user = @appliance.user
    redirect_to appliances_path if @user != current_user
  end

  def appliance_params
    params.require(:appliance).permit(:user_id, :category_id, :maker, :image, :product, :model, :purchase_amount, :purchase_day, :warranty_period, :start_operation, :useful_life, :place, :frequency, :detail)
  end

  def appliance_after_month
    appliance_params.merge(@appliance_new.after_month)
  end
end
