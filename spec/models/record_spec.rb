require 'rails_helper'

RSpec.describe Record, type: :model do
  before do
    @record = FactoryBot.build(:record)
  end
  describe '商品出品' do
    context '商品出品できる時'do
     it '全てのカラムが存在すれば登録できる' do
      expect(@record).to be_valid
     end
    end
  end
end