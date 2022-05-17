FactoryBot.define do
  factory :address do
        postal_code             {'123-4567'}
        prefecture_id           {2}
        city                    {'横浜市緑区'}
        building                {'マンション'}
        phone_number            {'09012345678'}
        address                 {'青山1−1−1'}
        association :record
      end
    end
