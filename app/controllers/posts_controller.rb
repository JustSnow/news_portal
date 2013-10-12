class PostsController < ApplicationController
  before_filter :check_user, except: [:index, :show]
  before_filter :find_post, except: [:index, :new, :create, :feed, :delete_comment, :preview]

  # GET /posts
  # GET /posts.json
  def index
    @posts = current_user.posts.not_preview

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = current_user.posts.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = current_user.posts.build(params[:post])

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    redirect_to posts_path if user_signed_in?
  end

  def feed
    @posts = Post.all

    respond_to do |format|
      format.html
      format.rss { render layout: false }
    end
  end

  def comments
    user_id = (current_user.nil?)? 0 : current_user.id
    @comment = Comment.build_from @post, user_id, params[:comment][:comment]
    
    if @comment.save
      if params[:replay]
        @parent_comment = Comment.find(params[:replay])
        @comment.move_to_child_of(@parent_comment)
      end
      redirect_to @post, notice: 'Comment was successfully added'
    else
      redirect_to @post, alert: 'Error add comment'
    end
  end

  def delete_comment
    @comment = Comment.find(params[:id])
    @comment.destroy
  end

  private 
    def check_user
      :authenticate_user! unless admin_user_signed_in?
    end

    def find_post
      @post = Post.find(params[:id])
    end
end
