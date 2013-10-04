class WelcomeController < ApplicationController
  def index
    @posts = Post.includes(:category)
    @posts = Category.find(params[:category]).posts if params[:category]

    @posts = @posts.accepted_posts
  end
end