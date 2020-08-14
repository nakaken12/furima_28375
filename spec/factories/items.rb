FactoryBot.define do
  factory :item do
    name                    { Faker::Code.ean }
    explanation             { Faker::Lorem.sentence }
    category_id             { 2 }
    status_id               { 2 }
    shipping_charge_id      { 2 }
    shipping_origin_id      { 2 }
    days_until_shipping_id  { 2 }
    price                   { 3000 }
    association :user

    # 画像紐付け
    after(:build) do |item|
      item.image.attach(io: File.open("#{Rails.root}/public/images/test_image.png"), filename: 'test_image.jpg', content_type: 'image/jpg')
    end

  end
end
