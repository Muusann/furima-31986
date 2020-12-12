FactoryBot.define do
  factory :user do
    nick_name              {"test"}
    email                 {"test@example"}
    password              {"aaa000"}
    password_confirmation {password}
    first_name            {"洋平"}
    last_name             {"川上"}
    first_name_f          {"ヨウヘイ"}
    last_name_f           {"カワカミ"}
    birth_day             {"1994-08-13"}
  end
end