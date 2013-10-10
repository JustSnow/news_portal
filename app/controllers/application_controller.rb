class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :all_categories

  private
  	def all_categories
      @categories = Category.find(:all)
    end
end
