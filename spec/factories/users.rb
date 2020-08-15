FactoryBot.define do
  factory :user do
    nickname               { Faker::Name.initials(number: 2) }
    email                  { Faker::Internet.free_email }
    password               { 'pass1234' }
    password_confirmation  { 'pass1234' }
    family_name_full_width { '高橋' }
    first_name_full_width  { '太郎' }
    family_name_kana       { 'タカハシ' }
    first_name_kana        { 'タロウ' }
    birthday               { Faker::Date.between(from: '1930-01-1', to: '2015-12-31') }
  end
end
