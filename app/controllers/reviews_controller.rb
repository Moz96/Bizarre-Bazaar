class ReviewsController < ApplicationController
  before_action :set_booking, only: [:new, :create]

  def new
    @review = @booking.reviews.new
  end

  def create
    @review = @booking.reviews.build(review_params)
    @review.item = @booking.item
    @review.user = User.first

    if @review.save
      redirect_to item_path(@booking.item), notice: 'Review was successfully created.'
    else
      render :new
    end
  end

  private

  def set_booking
    @booking = Booking.find(params[:booking_id])
  end

  def review_params
    params.require(:review).permit(:rating, :comment)
  end
end
