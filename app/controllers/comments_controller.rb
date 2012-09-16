class CommentsController < ApplicationController
  def create
    @comment = Comment.create!(params[:comment])
    flash[:notice] = "Thanks for commenting!"

    respond_to do |format|
      format.html { redirect_to post_path(@comment.post), notice: 'Comment was successfully created.' }
    end
  end
end
