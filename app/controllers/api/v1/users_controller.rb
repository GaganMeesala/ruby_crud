class  Api::V1::UsersController < ApplicationController

  before_action :set_user, only: [:show, :update, :destroy]

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
    end
  end

  def update
    if @user.update!(user_params)
      render json: {status: :success, message: "User updated successfully!"}
    end
  end

  def destroy
    if @user.destroy!
      render json: {status: :success, message: "User deleted successfully!"}
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :contact)
  end
end