# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



User.create(
    name: 'name',
    email: 'email@gmail.com',
    password_digest: '123@qwe',
    favorite: '',
)


Course.create(
    name: 'RubyonRails',
    owner: 'RubyonRails@Course',
    starts: 5,
    value: 40,
    description: 'You will learn everything about Ruby on Rails',
    image:'https://raw.githubusercontent.com/FelipeEnne/api_find_your_course/development/image/rubyonrails.png',
)

Course.create(
    name: 'Ruby',
    owner: 'Ruby@Course',
    starts: 4,
    value: 20,
    description: 'You will learn everything about Ruby',
    image:'https://raw.githubusercontent.com/FelipeEnne/api_find_your_course/development/image/ruby.png',
)

Course.create(
    name: 'HTML&CSS',
    owner: 'HTMLCSS@Course',
    starts: 4,
    value: 20,
    description: 'You will learn everything about HTML & CSS',
    image:'https://raw.githubusercontent.com/FelipeEnne/api_find_your_course/development/image/htmlcss.png',
)

Course.create(
    name: 'JavaScript',
    owner: 'JavaScript@Course',
    starts: 5,
    value: 30,
    description: 'You will learn everything about JavaScript',
    image:'https://raw.githubusercontent.com/FelipeEnne/api_find_your_course/development/image/javascript.jpeg',
)

Course.create(
    name: 'React',
    owner: 'React@Course',
    starts: 4,
    value: 40,
    description: 'You will learn everything about React',
    image:'https://raw.githubusercontent.com/FelipeEnne/api_find_your_course/development/image/react.png',
)


