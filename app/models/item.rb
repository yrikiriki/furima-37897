class Item < ApplicationRecord

  has_one_attached :image
  belongs_to :user

  validates :image,                 presence: true
  validates :item_name,             presence: true
  validates :item_info,             presence: true
  validates :category_id,           presence: true, numericality: { other_than: 1 }
  validates :item_status_id,        presence: true, numericality: { other_than: 1 }
  validates :shipping_fee_id,       presence: true, numericality: { other_than: 1 }
  validates :prefecture_id,         presence: true, numericality: { other_than: 1 }
  validates :scheduled_delivery_id, presence: true, numericality: { other_than: 1 }
  validates :price,                 presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300,less_than_or_equal_to: 9_999_999}, format: {with: /\A[0-9]+\z/ }
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_status
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :shipping_fee
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :scheduled_delivery
end
