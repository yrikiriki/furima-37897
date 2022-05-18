class RecordAddress
  include ActiveModel::Model
  attr_accessor :prefecture_id,:city,:postal_code,:address,:building,:phone_number,:user_id,:item_id,:record_id,:token

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :city,:address,:user_id,:item_id,:token
    validates :prefecture_id,  numericality: { other_than: 1 }
    validates :phone_number,format: {with: /\A[0-9]{10,11}\z/}
  end

  def save
    record = Record.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, building: building, phone_number: phone_number, address: address, record_id: record.id)
  end
end