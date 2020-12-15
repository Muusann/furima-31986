FactoryBot.define do
  factory :item do
    name                   {"test"}
    category_id            {"2"}
    condition_id           {"2"}
    description            {"説明です"}
    price                  {"300"}
    delivery_date_id       {"2"}
    delivery_fee_id        {"2"}
    prefecture_id          {"2"}

    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('spec/test_image/templar-4298112_1920.jpg'), filename: 'templar-4298112_1920.jpg', content_type: 'image/png')
    end
  end
end
