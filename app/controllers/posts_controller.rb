class PostsController < ApplicationController
  before_filter :require_login, :only => [:new, :edit, :create, :update, :destroy, :voteup, :votedown]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all(order: "votescore DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = Post.new
    @post.user_id = current_user.id

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(params[:post])

    respond_to do |format|
      if @post.save
        format.html { redirect_to posts_path, notice: 'Post was successfully created.' }
      else
        format.html { render action: "new", notice: 'Post failed to creat successfully.' }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to posts_path, notice: 'Post was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

  def voteup
    @post = Post.find(params[:id])

    @post.votescore = @post.votescore + 1
    @post.save

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.js
    end
  end

  def votedown
    @post = Post.find(params[:id])

    @post.votescore = @post.votescore - 1
    @post.save

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.js
    end
  end
end
