class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit,]
  before_action :move_to_index, only: [:edit, :destroy]
  before_action :params_id, only: [:show, :edit, :update, :destroy]

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
  end
  def edit
  end
  def update
    @item.update(item_params)
    if @item.save
      redirect_to item_path
    else
      render :edit
    end
  end
  def destroy
    @item.destroy
    redirect_to root_path
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
  def params_id
    @item = Item.find(params[:id])
  end
end
