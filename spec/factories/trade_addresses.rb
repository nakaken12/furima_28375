FactoryBot.define do
  factory :trade_address do
    postal_code        { '123-4567' }
    shipping_origin_id { 2 }
    city               { '青山1-1-1' }
    street_number      { '横浜市緑区' }
    room_number        { '柳ビル103' }
    phone_number       { '09012345678' }
    user_id            { create(:user) }
  end
end
