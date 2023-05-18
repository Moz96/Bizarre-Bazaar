class BookingsController < ApplicationController
  before_action :set_item, only: [:new, :create]
  before_action :set_booking, only: [:show, :destroy]

  def new
    @booking = @item.bookings.new
  end

  def create
    @booking = @item.bookings.new(booking_params)
    if @booking.save
      redirect_to item_booking_path(@item, @booking), notice: 'Booking was successfully created.'
    else
      flash.now[:alert] = 'Booking could not be created.'
      render :new
    end
  end

  def show
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
