class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show  
    @category = Category.find_by_name(dash_to_space(params[:id]))
    @articles = @category.articles
  end
end
