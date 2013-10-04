class WelcomeController < ApplicationController
  def index
    @posts = Post.includes(:category)
    @posts = Category.find(params[:category]).posts if params[:category]
    @posts = Post.tagged_with(params[:tag]) if params[:tag]

    @posts = @posts.accepted_posts
  end
end