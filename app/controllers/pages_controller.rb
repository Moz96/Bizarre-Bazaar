class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @categories = ["Useless", "Really Useless", "Too Tall", "Too Small", "Crunchy", "Pink"]
    if params[:category]
      @items = Item.where(category: params[:category])
    else
      @items = Item.all
    end
    @items = Item.all
    @markers = @items.geocoded.map do |item|
      {
        lng: item.longitude,
        lat: item.latitude,
        info_window_html: render_to_string(partial: "items/info_window",  locals: {item: item})
      }
    end 
  end
end
  