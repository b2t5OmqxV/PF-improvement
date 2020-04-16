class Admins::CategoriesController < ApplicationController
  def create
    @categorie_new = Categorie.new(categorie_params)
    @categorie_new.save
    redirect_to request.referer
  end

  def index
    @categorie_new = Categorie.new
    @categories = Categorie.all
  end

  def edit
    @categorie = Categorie.find(params[:id])
  end

  def update
    @categorie = Categorie.find(params[:id])
    @categorie.update
    redirect_to admins_categories_path
  end

  def destroy
    @categorie = Categorie.find(params[:id])
    @categorie.destroy
    redirect_to request.referer
  end

  private

  def categorie_params
    params.require(:categorie).permit(:category, :effective_life)
  end
end
