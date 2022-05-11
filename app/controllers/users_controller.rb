class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  def index
    @users = User.all
  end

  def show
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "file_name",
          template: "users/pdf",
          formats: [:html],
          layout: "pdf"
      end
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:password, :email, profile_attributes: [:id, :name, :nickname, :address, :dob, :telephone])
  end

  def set_user
    @user = User.find(params[:id])
  end
end
