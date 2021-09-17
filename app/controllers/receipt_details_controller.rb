class ReceiptDetailsController < ApplicationController
  def create
    cart_row = ReceiptDetail.new(receipt_detail_params)
    room = Room.find_by id: cart_row.room_id
    return flash.now[:warning] = t("rooms.not_exist") unless room

    total_time = ((cart_row.end_time - cart_row.from_time) / 3600).round(0)
    cart_row.into_money = sp_money(room, total_time)
    session[:cart].append cart_row
    flash.now[:success] = t "cart.add_success"
  end

  private

  def sp_money room, total_time
    if total_time < Settings.hour_in_day_20
      total_time.round * room.hourly_price
    elsif total_time > Settings.hour_in_month_24_20
      (total_time / Settings.hour_in_month_24_20).round * room.monthly_price
    else
      (total_time / Settings.hour_24).round * room.day_price
    end
  end

  def receipt_detail_params
    params.require(:receipt_detail).permit(:room_id, :from_time,
                                           :end_time, :amount_of_people)
  end
end
