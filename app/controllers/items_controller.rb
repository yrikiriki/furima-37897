class ItemsController < ApplicationController
    
  def index
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


  private

  def item_params
    params.require(:item).permit(:image,:item_name,:item_info,:category_id,:item_status_id,:shipping_fee_id,:prefecture_id,:scheduled_delivery_id,:price).merge(user_id: current_user.id)
  end
end
