class ReservationsController < ApplicationController
  def show
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    if params[:force].present?
      unless current_user == @reservation.space.user
        flash[:danger] = '不正なアクセスです'
        redirect_to root_path and return
      end
      flash[:success] = '予約を取り消しました。'
      redirect_to reservations_space_path @reservation.space
    else
      unless current_user == @reservation.user
        flash[:danger] = '不正なアクセスです'
        redirect_to root_path and return
      end
      flash[:success] = '予約の取り消しを行いました。キャンセル料が別途発生します。'
      redirect_to root_path
    end
  end

  def new
    @charge = 0
    @option_charge = 0
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
    @charge = 0
    @option_charge = 0
    if params[:calc].present?
      space = @reservation.space
      time = @reservation.end_time_block - @reservation.start_time_block + 1
      @charge = space.charge * time
      options = params[:reservation][:option] || {}
      options.each do |key, value|
        @option_charge += Option.find_by(id: key).try(:charge) * time if value == 'true'
      end
      render 'new'
    elsif @reservation.save
      options = params[:reservation][:option] || {}
      options.each do |key, value|
        ReservationOption.create(reservation_id: @reservation.id, option_id: key.to_i) if value == 'true'
      end
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
