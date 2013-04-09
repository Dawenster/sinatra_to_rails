class ApplicationController < ActionController::Base
  protect_from_forgery

  def space_to_dash(text)
    text.gsub(' ','-')
  end

  def dash_to_space(text)
    text.gsub('-',' ')
  end

  helper_method :space_to_dash, :dash_to_space
end
