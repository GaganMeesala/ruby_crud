class Api::V1::UsersController < ApplicationController
  before_action :authorize_request, except: :create
  before_action :find_user, except: %i[create index]

  def index
    @users = User.all
  end

  def show
    render json: {status: :success, user: @user}
  end

  def create
    @user = User.new(user_params)
    if @user.save!
      render json: {status: :success, message: "User created successfully!"}
    else
      render json: {status: :failure, errors: @user.errors.full_messages}
    end
  end

  def update
    if @user.update!(user_params)
      render json: {status: :success, message: "User updated successfully!"}
    else
      render json: {status: :failure, errors: @user.errors.full_messages}
    end
  end

  def destroy
    if @user.destroy!
      render json: {status: :success, message: "User deleted successfully!"}
    else
      render json: {status: :failure, errors: @user.errors.full_messages}
    end
  end

  private

  def find_user
    @user = User.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: {errors: 'User not found'}, status: :not_found
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :contact, :password, :password_confirmation)
  end
end