FactoryBot.define do
  factory :purcha_address do
   prefecture_id           {2}
   address_number          {"2"}
   post_code               {"222-2222"}
   phone_number            {"22222222222"}
   municipalities          {"2"}
   token                   {'test'}
   user_id                 {2}
   item_id                 {2}
  end
end