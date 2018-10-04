FactoryBot.define do
  factory :user do
    username "johndoe"
    email "john@gmail.com"
    password "password"
    password_confirmation "password"
  end

  factory :random_user, class: User do
    username { Faker::Name.first_name.downcase }
    email { Faker::Name.first_name.downcase + "@gmail.com" }
    password "password"
    password_confirmation "password"
  end
end
