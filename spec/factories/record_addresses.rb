FactoryBot.define do
  factory :record_address do
        postal_code             {'123-4567'}
        prefecture_id           {2}
        city                    {'横浜市緑区'}
        building                {'マンション'}
        phone_number            {'09012345678'}
        address                 {'青山1−1−1'}
        token                   {"tok_abcdefghijk00000000000000000"}
  end
end
