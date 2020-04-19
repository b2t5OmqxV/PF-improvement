class Admins::NoticesController < ApplicationController
  def new
    @notice_new = Notice.new
    @users = User.all
    @appliances = Appliance.all
    @categories = Category.all
  end

  def create
    @notice_new = Notice.new(notice_params)
    @notice_new.admin = current_admin
    @notice_new.save
    redirect_to admins_notices_path
  end

  def index
    @notices = Notice.all
  end

  def show
    @notice = Notice.find(params[:id])
  end

  def edit
    @notice = Notice.find(params[:id])
  end

  def update
    @notice = Notice.find(params[:id])
    @notice.update(notice_params)
    redirect_to admins_notice_path(@notice.id)
  end

  def destroy
    @notice = Notice.find(params[:id])
    @notice.destroy
    redirect_to admins_notices_path
  end

  private

  def notice_params
    params.require(:notice).permit(:admin_id, :title, :text)
  end
end
