FactoryBot.define do
  factory :user do
    name { 'name' }
    email { 'name@email.com' }
    password { '123@qwe' }
    password_confirmation { '123@qwe' }
    favorite { '' }
  end
end
