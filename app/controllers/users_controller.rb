class UsersController < ApplicationController
  before_filter :require_login, only: :show

  def show
    @user = User.find(params[:id])
    @upvotecount = @user.votes.find(
      :all, 
      :conditions => "vote = 'up'").count
    @downvotecount = @user.votes.find(
      :all,
      :conditions => "vote = 'down'").count
    if @user.twitter.blank?
    else
      begin
        @twitterposts = Twitter.user_timeline(@user.twitter).first(20) if @user.twitter
      rescue
      end
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      UserMailer.signup_confirmation(@user).deliver
      redirect_to posts_path, notice: 'User was successfully created.'
    else
      render action: "new"
    end
  end
end
