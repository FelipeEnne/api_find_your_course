<h1 align="center">Find your course API</h1>

## Table of contents

  - [About](#about)
  - [The back-end API](#the-back-end-api)
  - [Technologies used](#technologies-used)
  - [Contact](#contact)
  - [Acknowledgments](#acknowledgments)
  - [Show your support](#show-your-support)

## About

The project's goal was to build a mobile web app based on a <a href="https://www.behance.net/gallery/37706679/Circle-(Landing-page-Dashboard-Mobile-App)"> find your house app.</a>
The back-end was used REST API done with Ruby on Rails. 
The front-end was used React and Redux. 

The project's assignment can be seen <a href="https://www.notion.so/Final-Capstone-Project-Find-Your-House-9a424802e7dc48eb8ef40e2ac09397d1"> here</a>

The front-end repository can be found <a href="https://github.com/FelipeEnne/find-your-course"> here</a>



## The back-end API


The API was used to handle the project data.


### Data in the users table

* name
* email
* password_digest
* favorite

### Data in courses table

* name
* owner
* starts
* value
* description
* image

The API has the following endpoints

`POST /login`

allow user login

`POST /users`

allows user signup

`GET /users`

returns all users information

`GET /users/id`

returns the user information

`POST /users/id`

allows user to edit the favorite

`GET /courses`

returns all courses

`GET /courses/id`

returns a specific courses


### Live version

You can find <a href="https://protected-beyond-23220.herokuapp.com/"> here</a>


#### Local usage

To use this API locally, follow the steps:

* Clone the repository
* Open your terminal and navigate to repository's folder
* Run:
  * Bundle install
  * Rails db:create
  * Rails db:migrate
  * Rails db:seed
  * Rails s

## Technologies used

To create this project I used:

* Ruby on Rails
* bcrypt gem
* Heroku
* Postgresql
* rspec

## Contact

Felipe Enne - felipeenne@gmail.com | <a href="https://github.com/FelipeEnne">GitHub</a> | <a href="https://www.linkedin.com/in/felipe-enne/">Linkedin</a>

## Acknowledgements

- [Microverse](https://www.microverse.org/)

## Show your support

Give a ⭐️ if you like this project!

