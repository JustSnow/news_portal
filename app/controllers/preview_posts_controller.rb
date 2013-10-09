class PreviewPostsController < ApplicationController
  before_filter :find_prev_post

  def create
  end

  def update
  end

  def show
  end

  def destroy
  end

  private
    def find_prev_post
      @post = Post.find(params[:post_id])
      # @preview_post = PreviewPost.find(params[:id])
    end
end