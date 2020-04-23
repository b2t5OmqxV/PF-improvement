class Admins::SearchesController < ApplicationController
  def search
    @appliance_or_user = params[:option]
    if @appliance_or_user == '1'
      @appliances = Appliance.search(params[:search], @appliance_or_user)
    else
      @users = User.search(params[:search], @appliance_or_user)
    end
    render action: :search
  end
end
