class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @categories = ["Useless", "Really Useless", "Too Tall", "Too Small", "Crunchy", "Pink"]
    if params[:category]
      @items = Item.where(category: params[:category])
    else
      @items = Item.all
    end
  end
end
