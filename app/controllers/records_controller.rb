class RecordsController < ApplicationController

  def index
    @record_address = RecordAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @record_address = RecordAddress.new(record_params)
    if @record_address.valid?
    pay_item
      @record_address.save
    redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def record_params
    params.require(:record_address).permit(:postal_code, :prefecture_id, :city, :building, :phone_number, :address).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = "sk_test_e553ecab4500dc48c98f9b52"  
      Payjp::Charge.create(
        amount: @item.price, 
        card: record_params[:token],    
        currency: 'jpy'                 
      )
  end

end
