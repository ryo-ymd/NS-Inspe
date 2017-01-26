class Admin::SpacesController < ApplicationController
  before_action :set_space, only: [:authorize, :drop]

  def index
    @spaces = Space.all
  end

  def update
  end

  def authorize
    flash[:success] = '認可しました。'
    @space.update(authorized: true)
    redirect_to admin_spaces_path
  end

  def drop
    flash[:success] = '強制非公開にしました。'
    @space.update(visible: false)
    redirect_to admin_spaces_path
  end

  private
  def set_space
    @space = Space.find(params[:id])
  end
end
