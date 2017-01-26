class Admin::UsersController < ApplicationController
  def index
    @user = User.all
  end

  def update
  end

  def destroy
  end
end
