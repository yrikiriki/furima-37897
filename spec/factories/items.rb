FactoryBot.define do
  factory :item do
    item_name             {'test'}
    item_info             {'11111a'}
    category_id           {2}
    item_status_id        {2}
    shipping_fee_id       {2}
    prefecture_id         {2}
    scheduled_delivery_id {2}
    price                 {'500'}
    association :user 
    after(:build) do |item|
      item.image.attach(io: File.open('public/image/test.png'), filename: 'test.png')
    end
  end
end