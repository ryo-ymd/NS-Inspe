class ReservationsController < ApplicationController
  def show
  end

  def destroy
  end

  def new
    @reservation = Reservation.new(
        start_time_block: params[:start],
        end_time_block: params[:start],
        space_id: params[:space],
        date: params[:date]
    )
    @user = current_user.id
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      flash[:success] = '予約が完了しました。'
      redirect_to @reservation.space
    else
      render 'new'
    end
  end

  private
  def reservation_params
    params.require(:reservation).permit(
                                    :date,
                                    :space_id,
                                    :start_time_block,
                                    :end_time_block,
                                    :user_id
    )
  end
end
