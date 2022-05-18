require 'rails_helper'

RSpec.describe RecordAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @record_address = FactoryBot.build(:record_address, user_id: user.id, item_id: item.id)
  end
  describe '商品購入' do
    context '商品購入できる時'do
     it '全てのカラムが存在すれば購入できる' do
      expect(@record_address).to be_valid
     end
     it 'buildingがからでも購入できる' do
      @record_address.building = ''
      expect(@record_address).to be_valid
     end
    end
    context '新規購入できないとき' do
      it 'postal_codeが空では購入できない' do
       @record_address.postal_code = ''
       @record_address.valid?
       expect(@record_address.errors.full_messages).to include("Postal code can't be blank")
      end
       it 'prefecture_idが1では購入できない' do
        @record_address.prefecture_id = '1'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Prefecture must be other than 1")
       end
       it 'cityが空では購入できない' do
        @record_address.city = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("City can't be blank")
       end
       it 'phone_numberが空では購入できない' do
        @record_address.phone_number = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Phone number can't be blank")
       end
       it 'addressが空では購入できない' do
        @record_address.address = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Address can't be blank")
       end
       it 'tokenが空では購入できない' do
        @record_address.token = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Token can't be blank")
       end
       it 'postal_codeが「3桁ハイフン4桁」の半角文字列出なければ購入できない' do
        @record_address.postal_code = '1234567'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Postal code is invalid")
       end
       it 'phone_numberが9桁以下では購入できない' do
        @record_address.phone_number = '090123456'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Phone number is invalid")
       end
       it 'phone_numberが12桁以上では購入できない' do
        @record_address.phone_number = '090123456789'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Phone number is invalid")
       end
       it 'phone_numberが全角だと購入できない' do
        @record_address.phone_number = '０９０３４５６７８９８'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Phone number is invalid")
       end
       it 'userが紐付いていなければ購入できない' do
        @record_address.user_id = nil
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("User can't be blank")
       end
       it 'itemが紐付いていなければ購入できない' do
        @record_address.item_id = nil
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Item can't be blank")
       end
    end
  end
end