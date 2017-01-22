class SpacesController < ApplicationController
  before_action :set_space, only:[:show, :edit, :update, :destroy]
  def index
    @spaces = Space.recent.visible
  end

  def show
    @available_list = []
    7.times do |day|
      @available_list << @space.available_list_at(Time.now + day.day)
    end
  end

  def new
    @space = Space.new
    @user = current_user
  end

  def create
    @space = Space.new(space_params)
    if @space.save
      flash[:success] = 'スペースの登録に成功しました'
      redirect_to @space
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def search
  end

  private
  def space_params
    params.require(:space).permit(
                              :user_id,
                              :name,
                              :address,
                              :mail_address,
                              :tel,
                              :description,
                              :photo,
                              :charge,
                              :cancellation_charge,
                              :member_limit,
                              :space_type,
                              options_attributes: [:space_id, :option_name, :count, :charge, :_destroy]
    )
  end

  def set_space
    @space = Space.find(params[:id])
  end
end
