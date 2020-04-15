class Users::NoticesController < ApplicationController
  def show
    @notices = Notice.find(params[:id])
  end
end
