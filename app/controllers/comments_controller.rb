class CommentsController < ApplicationController
  before_action :set_commentable, only: %i[create destroy]
  before_action :authenticate_user, only: %i[create destroy]

  def create
    @comment = @commentable.comments.new(comment_params)
    @comment.user = current_user
    @comment.save
    redirect_to @commentable
  end

  def destroy
    @comment = @commentable.comments.find(params[:id])
    @comment.destroy
    redirect_to @commentable, status: 303
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_commentable
    if params[:post_id].present?
      @commentable = Post.find(params[:post_id])
    elsif params[:event_id].present?
      @commentable = Event.find(params[:event_id])
    end
  end
end
