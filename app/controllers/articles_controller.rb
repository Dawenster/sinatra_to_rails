class ArticlesController < ApplicationController
  def show
    title = dash_to_space(params[:id])
    @article = Article.find_by_title(title)
  end

  def old_url
    @article = Article.find_by_url(params[:title])
    redirect_to category_article_path(space_to_dash(@article.category.name), space_to_dash(@article.title))
  end
end
