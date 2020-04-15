class Users::AppliancesController < ApplicationController
  def top
    @categories = Categorie.all
    @notices = Notice.all
    @appliances = Appliance.all.order(created_at: :desc)
  end

  def new; end

  def create; end

  def index; end

  def show; end

  def edit; end

  def update; end

  def destroy; end

  private

  def appliances_params
    params.require(:appliances).permit(:user_id, :category_id, :maker, :image, :product, :model, :purchase_amount, :purchase_day, :warranty_period, :start_operation, :place, :frequency, :detail)
  end
end
