FactoryBot.define do
  factory :user do
    id { 0 }
    name { 'name' }
    email { 'name@email.com' }
    password_digest { '123@qwe' }
    favorite { '' }
  end
end
