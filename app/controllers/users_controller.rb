class UsersController < ApplicationController
  before_action :authorize_request, only: %i[index]
  skip_before_action :authorize_request, only: %i[create find]
  prepend_before_action :authorize_request, only: %i[show update destroy]
  prepend_before_action :verify_user_exists, only: %i[show update destroy]

  before_action :set_user, only: %i[show update destroy]

  def index
    @users = [current_user]

    render json: @users
  end

  def show
    render json: @user
  end

  def create
    @user = User.new(cuser_params)

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
    head :no_content
  end

  def find
    @user = get_user(cuser_params)

    if @user.nil?
      render json: { error: 'Invalid credentials' }, status: :unauthorized
    elsif @user.authenticate(params[:password])
      token = JsonWebToken.encode(user_id: @user.id)
      render json: { token: token, user: @user }
    else
      render json: false, status: :unauthorized
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
    return if performed?

    unless current_user
      render json: { error: 'Unauthorized' }, status: :unauthorized
      return
    end

    head :forbidden unless @user == current_user
  end

  def verify_user_exists
    User.find(params[:id])
  end

  def get_user(par)
    User.find_by(name: par[:name])
  end

  def user_params_favorite
    params.permit(:favorite)
  end

  def cuser_params
    params.permit(:name, :email, :password, :password_confirmation, :favorite)
  end
end
