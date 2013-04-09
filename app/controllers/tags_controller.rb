class TagsController < ApplicationController
  def show
    @tag = Tag.find_by_name(dash_to_space(params[:id]))
  end
end
