class PostsController < ApplicationController
  before_filter :require_login, :only => [:new, :create, :voteup, :votedown]

  def index
    @category = params[:category]

    if @category.nil?
      @posts = Post.all(order: "votescore DESC")
    else
      @posts = Post.find(
        :all,
        :conditions => "category = '#{@category}'")
    end
  end

  def show
    @post = Post.find(params[:id])
    @new_comment = @post.comments.build
  end

  def new
    @post = Post.new
    @post.user_id = current_user.id
  end

  def create
    @post = Post.new(params[:post])

    if @post.save
      redirect_to posts_path, notice: 'Post was successfully created.'
    else
      render action: "new", notice: 'Post failed to creat successfully.'
    end
  end

  def voteup
    @post = Post.find(params[:id])
    @vote = @post.votes.find(:all, :conditions => "user_id = #{current_user.id}")

    if @vote.empty?
      @post.votescore = @post.votescore + 1
      @post.save
      @vote = @post.votes.new(user_id: current_user.id)
      @vote.vote = "up"
      @vote.save

      respond_to do |format|
        format.html { redirect_to posts_url }
        format.js
      end
    else
      redirect_to posts_path, notice: 'You can only vote once'        
    end
  end

  def votedown
    @post = Post.find(params[:id])
    @vote = @post.votes.find(
      :all,
      :conditions => "user_id = #{current_user.id}")

    if @vote.empty?
      @post.votescore = @post.votescore - 1
      @post.save
      @vote = @post.votes.new(user_id: current_user.id)
      @vote.vote = "down"
      @vote.save

      respond_to do |format|
        format.html { redirect_to posts_url }
        format.js
      end
    else
      redirect_to posts_path, notice: 'You can only vote once'        
    end
  end
end
