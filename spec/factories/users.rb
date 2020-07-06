FactoryBot.define do
  factory :user do
    id { 0 }
    name { 'name' }
    email { 'name@email.com' }
    password { '123@qwe' }
    password_confirmation { '123@qwe' }
    favorite { '' }
  end
end
