class UsersController < ApplicationController
  before_action :user_already_signed_in, only: %i[new create]
  before_action :user_signed_in, except: %i[index new create]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(sign_up_params)
    if @user.save
      session[:current_user] = @user.id
      flash[:notice] = 'Welcome '+current_user.fullname
      redirect_to users_path
    else
      flash[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = current_user
  end

  def update
    if current_user.update(sign_up_params)
      flash[:notice] = 'Your account has been successfully updated'
      redirect_to current_user
    else
      flash[:errors] = current_user.errors.full_messages
      @user = current_user
      render :edit
    end
  end

  private

  def sign_up_params
    params.require(:user).permit(:username, :fullname, :photo, :cover_image)
  end
end
