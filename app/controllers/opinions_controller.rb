class OpinionsController < ApplicationController
  before_action :user_signed_in, except: %i[index]
  before_action :ownership, only: %i[edit update]

  def ownership
    return unless current_user.owns?(params[:id])

    flash[:notice] = 'You do not own this post, you cannot edit nor delete it!'
    redirect_to root_path
    false
  end

  def index
      @opinions = current_user.nil? ? Opinion.all.ordered_by_most_recent : current_user.opinion_feed.ordered_by_most_recent
      @opinion = Opinion.new
  end

  def new
    @opinion = Opinion.new
  end

  def create
    opinion = current_user.opinions.build(opinion_params)

    if opinion.save
      flash[:notice] = "Your book review about "+opinion.book_name+" was published"
      redirect_to root_path
    else
      flash[:errors] = opinion.errors.full_messages
      redirect_to root_path
    end
  end

  def show
    @opinion = Opinion.find(params[:id])
    @comments = Comment.all
  end

  def edit
    @opinion = Opinion.find(params[:id])
    @opinions = Opinion.all
  end

  def update
    opinion = Opinion.find(params[:id])
    if opinion.update(opinion_params)
      flash[:notice] = "Your book review about "+opinion.book_name+" was updated"
      redirect_to opinion
    else
      flash[:errors] = opinion.errors.full_messages
      render :edit
    end
  end

  def destroy
    opinion = Opinion.find(params[:id])
    if opinion.destroy
      flash[:notice] = "Your book review about "+opinion.book_name+" was deleted"
      redirect_to root_path
    else
      flash[:errors] = ['Could not delete this book review']
      redirect_to root_path
    end
  end

  private

  def opinion_params
    params.require(:opinion).permit(:book_name, :book_author, :published_at, :content, :book_link)
  end
end
