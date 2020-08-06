FactoryBot.define do
  factory :user do
    nickname               { Faker::Name.initials(number: 2) }
    email                  { Faker::Internet.free_email }
    password               { Faker::Internet.password(min_length: 6) }
    password_confirmation  { password }
    family_name_full_width { '高橋' }
    first_name_full_width  { '太郎' }
    family_name_kana       { 'タカハシ' }
    first_name_kana        { 'タロウ' }
    birthday               { Faker::Date.between(from: '1930-01-1', to: '2015-12-31') }
  end
end
