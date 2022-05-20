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
       expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
      it 'item_infoが空では登録できない' do
        @item.item_info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
       end
       it 'category_idが1では登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーは1以外の値にしてください")
       end
       it 'item_status_idが1では登録できない' do
        @item.item_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態は1以外の値にしてください")
       end
       it 'shipping_fee_idが1では登録できない' do
        @item.shipping_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担は1以外の値にしてください")
       end
       it 'prefecture_idが1では登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域は1以外の値にしてください")
       end
       it 'scheduled_delivery_idが1では登録できない' do
        @item.scheduled_delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数は1以外の値にしてください")
       end
       it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格を入力してください")
       end
       it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品画像を入力してください")
       end
       it 'priceが全角数値では登録できない' do
        @item.price = '12３４'
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は数値で入力してください")
       end
       it 'priceが299円以下では登録できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は300以上の値にしてください")
       end
       it 'priceが10,000,000円以上では登録できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は9999999以下の値にしてください")
       end
       it 'userが紐付いていなければ登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Userを入力してください")
       end
    end
  end
end