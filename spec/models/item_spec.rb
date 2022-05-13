require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品出品' do
    context '商品出品できる時'do
     it '全てのカラムが存在すれば登録できる' do
      expect(@item).to be_valid
     end
    end
    context '商品出品できないとき' do
      it 'item_nameが空では登録できない' do
       @item.item_name = ''
       @item.valid?
       expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it 'item_infoが空では登録できない' do
        @item.item_info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item info can't be blank")
       end
       it 'category_idが1では登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
       end
       it 'item_status_idが1では登録できない' do
        @item.item_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item status must be other than 1")
       end
       it 'shipping_fee_idが1では登録できない' do
        @item.shipping_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee must be other than 1")
       end
       it 'prefecture_idが1では登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
       end
       it 'scheduled_delivery_idが1では登録できない' do
        @item.scheduled_delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Scheduled delivery must be other than 1")
       end
       it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
       end
       it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
       end
       it 'priceが全角数値では登録できない' do
        @item.price = '12３４'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
       end
       it 'priceが299円以下では登録できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
       end
       it 'priceが10,000,000円以上では登録できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
       end
       it 'userが紐付いていなければ登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
       end
    end
  end
end