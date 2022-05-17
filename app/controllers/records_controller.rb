class RecordsController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :params_item_id, only: [:index,:create]
  before_action :move_to_index, only: :index

  def index
    @record_address = RecordAddress.new
  end

  def create
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
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price, 
        card: record_params[:token],    
        currency: 'jpy'                 
      )
  end
  def move_to_index
    if @item.record == nil
    unless user_signed_in? && current_user.id != @item.user_id
      redirect_to root_path
    end
    else
      redirect_to root_path
    end
  end
  def params_item_id
  @item = Item.find(params[:item_id])
  end
end
