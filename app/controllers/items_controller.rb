class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new
  before_action :move_to_index, only: :edit

  def index
    @items = Item.all.order(id: "DESC")
  end
  
  def new
    @item = Item.new
  end
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
      return
    else
      render :new
    end
  end
  def show
    @item = Item.find(params[:id])
  end
  def edit
    @item = Item.find(params[:id])
  end
  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    if @item.save
      redirect_to item_path
    else
      render :edit
    end
  end


  private

  def item_params
    params.require(:item).permit(:image,:item_name,:item_info,:category_id,:item_status_id,:shipping_fee_id,:prefecture_id,:scheduled_delivery_id,:price).merge(user_id: current_user.id)
  end

  def move_to_index
    @item = Item.find(params[:id])
    unless user_signed_in? && current_user.id == @item.user_id
      redirect_to action: :index
    end
  end
end
