class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: :show
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
    puts "@item: #{@item}"
  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user
    if @item.save!
      redirect_to root_path
    else
      flash.now[:alert] = 'Item could not be created'
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
    @reviews = @item.reviews
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      flash.now[:alert] = 'Item could not be updated'
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :description)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
