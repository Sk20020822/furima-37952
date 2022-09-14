FactoryBot.define do
  factory :user do
    nickname              {"tarou"}
    email                 {Faker::Internet.free_email}
    password              {"ab1234"}
    encrypted_password    {"ab1234"}
    last_name             {"山田"}
    last_name_kana        {"ヤマダ"}
    first_name            {"太郎"}
    first_name_kana       {"タロウ"}
    birth_date             {"2000-01-01"}
  end
end

