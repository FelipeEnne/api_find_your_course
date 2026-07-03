# Be sure to restart your server when you modify this file.

Rails.application.config.filter_parameters += %i[
  password
  password_confirmation
  passw
  secret
  token
  _key
  crypt
  salt
  certificate
  otp
  ssn
]
