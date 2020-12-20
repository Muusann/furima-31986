FactoryBot.define do
  factory :address do
    purcha_id         {2}
    post_code         {2}
    phone_number      {2}
    prefecture_id     {2}
    address_number    {2}
    municipalities    {"test"}
  end
end
