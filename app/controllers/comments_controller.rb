class CommentsController < ApplicationController
  before_action :user_signed_in
  before_action :comment_ownership

  def comment_ownership
    return unless current_user.owns_comment?(params[:id])

    flash[:notice] = 'You do not own this comment, you cannot edit nor delete it!'
    redirect_to root_path
    false
  end

  def create
    comment = Comment.new(content: params[:comment][:content])
    comment.opinion = Opinion.find(params[:opinion_id])
    comment.author = current_user
    if comment.save
      redirect_to opinion_path(comment.opinion), notice: 'Thanks for commenting this review'
    else
      redirect_to opinion_path(comment.opinion), errors: comment.errors.full_messages
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    comment = Comment.find(params[:id])
    if comment.update(content: params[:comment][:content])
      redirect_to opinion_path(comment.opinion), notice: 'Your comment has been updated'
    else
      redirect_to opinion_path(comment.opinion), errors: comment.errors.full_messages
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    if comment.destroy
      redirect_to root_path, notice: 'Your comment has been deleted'
    else
      redirect_to root_path, errors: comment.errors.full_messages
    end
  end
end
