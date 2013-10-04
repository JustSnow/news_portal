class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :get_categories

  def get_categories
    @categories = Category.all
  end
end
