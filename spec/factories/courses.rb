FactoryBot.define do
  factory :course do
    id { 0 }
    name { 'RubyonRails' }
    owner { 'RubyonRails@Course' }
    starts { 5 }
    value { 40 }
    description { 'You will learn everything about Ruby on Rails' }
    image { 'https://raw.githubusercontent.com/FelipeEnne/api_find_your_course/development/image/rubyonrails.png' }
  end
end
