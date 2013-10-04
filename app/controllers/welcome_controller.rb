class WelcomeController < ApplicationController
  def index
    @posts = Post.includes(:category)
    @posts = Category.find(params[:category]).posts if params[:category]
    @posts = Post.tagged_with(params[:tag]) if params[:tag]
    @posts = Post.search params[:search] if params[:search]

    @posts = @posts.accepted_posts.paginate(page: params[:page], per_page: 10)
  end
end