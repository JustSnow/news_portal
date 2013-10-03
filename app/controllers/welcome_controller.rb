class WelcomeController < ApplicationController
  def index
    @posts = Post.accepted_posts
  end
end