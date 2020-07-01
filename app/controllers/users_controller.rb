class UsersController < ApplicationController
  before_action :set_user, only: %i[show update destroy]

  def index
    @users = User.all

    render json: @users
  end

  def show
    render json: @user
  end

  def create
    @user = User.create(cget_user_params)

    if @user.save
      render json: @user, status: :created
    else
      render json: false, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params_favorite)
      render json: @user
    else
      render json: false, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
  end

  def find
    @user = get_user(cget_user_params)
    if @user && @user.password_digest == params[:password]
      render json: @user
    else 
      render json: false, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def get_user(par)
    User.find_by(name: par[:name])
  end

  def user_params_favorite
    params.permit(:favorite)
  end

  def cget_user_params
    params.permit(:name, :email, :password_digest, :favorite)
  end

  def user_params
    params.require(:user).permit(:name, :email, :password_digest, :favorite)
  end
end
