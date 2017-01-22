class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :spaces, :reservations]
  before_action :owner_only, only: [:owners]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = 'ユーザー登録に成功しました'
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def spaces
    @spaces = Space.recent.where(user_id: params[:id]).visible
  end

  def reservations

  end

  private
  def user_params
    params.require(:user).permit(
                             :mail,
                             :name,
                             :password,
                             :member_type
    )
  end

  def set_user
    @user = User.find(params[:id])
  end

  def owner_only
    unless User.find(params[:id]).owner?
      flash[:error] = 'オーナー専用です'
      redirect_to user_path User.find(params[:id])
    end
  end
end
