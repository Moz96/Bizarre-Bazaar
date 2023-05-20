class BookingsController < ApplicationController
  before_action :set_item, only: [:new, :create, :show]
  before_action :set_booking, only: [:show, :destroy]
  before_action :authenticate_user!, only: [:new, :create]

  def new
    @booking = @item.bookings.new
  end

  def create
    @booking = @item.bookings.new
    @booking.user = current_user
    # raise
    if @booking.save
      redirect_to item_booking_path(@item, @booking), notice: 'Booking was successfully created.'
    else
      flash.now[:alert] = 'Booking could not be created.'
      redirect_to root_path
    end
  end

  def show
    if user_signed_in?
      render 'show'
    else
      redirect_to new_user_session_path, alert: 'You need to sign in to book this item.'
    end
  end

  def destroy
    @booking.destroy
    redirect_to root_path, notice: 'Booking was successfully deleted.'
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:user_id, :item_id)
  end
end
