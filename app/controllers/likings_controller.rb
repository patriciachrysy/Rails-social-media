class LikingsController < ApplicationController
  before_action :user_signed_in

  def create
    liking = Liking.new(status: params[:status])
    liking.opinion = Opinion.find(params[:opinion_id])
    liking.user = current_user
    if liking.save
      redirect_to root_path, notice: 'Thanks for judging this book review'
    else
      redirect_to root_path, errors: liking.errors.full_messages
    end
  end

  def update
    liking = Liking.find(params[:id])
    if liking.update(status: params[:status])
      redirect_to root_path, notice: 'You judgement has been updated'
    else
      redirect_to root_path, errors: liking.errors.full_messages
    end
  end
end
