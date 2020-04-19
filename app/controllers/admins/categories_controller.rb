class Admins::CategoriesController < ApplicationController
  def create
    @category_new = Category.new(category_params)
    @category_new.save
    redirect_to request.referer
  end

  def index
    @category_new = Category.new
    @categories = Category.all
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    @category.update(category_params)
    redirect_to admins_categories_path
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to request.referer
  end

  private

  def category_params
    params.require(:category).permit(:category, :effective_life)
  end
end
