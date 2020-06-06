class SessionsController < ApplicationController
  before_action :user_already_signed_in, except: %i[destroy]

  def new
  end

  def create
    @user = User.find_by(sign_in_params)
    if @user.nil?
      flash[:errors] = ['Incorrect username, please try again or sign up if you do not have an account.']
      redirect_to sign_in_path
    else
      session[:current_user] = @user.id
      flash[:notice] = 'Welcome '+current_user.fullname
      redirect_to users_path
    end
  end

  def destroy
    session[:current_user] = nil
    flash[:notice] = 'Thanks for visiting.'
    redirect_to users_path
  end

  private

  def sign_in_params
    params.permit(:username)
  end
end
