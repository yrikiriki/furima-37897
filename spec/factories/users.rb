FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {Faker::Internet.free_email}
    password              {'11111a'}
    password_confirmation {password}
    last_name             {'テスト'}
    first_name            {'テスター'}
    last_name_kana        {'テスト'}
    first_name_kana       {'テスタ'}
    birth_date            {'1997-5-24'}
  end
end
