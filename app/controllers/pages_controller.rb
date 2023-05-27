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
        info_window: "<h1>Hello</h1>"
      }
    end 
  end
end
