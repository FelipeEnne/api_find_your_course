class JsonWebToken
  SECRET_KEY = Rails.application.credentials.secret_key_base || ENV.fetch('SECRET_KEY_BASE')

  def self.encode(payload, exp = 24.hours.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, SECRET_KEY)
  end

  def self.decode(token)
    return if token.blank?

    body = JWT.decode(token, SECRET_KEY, true, algorithm: 'HS256')[0]
    return unless body.key?('exp') && body.key?('user_id')

    HashWithIndifferentAccess.new(body)
  rescue JWT::DecodeError, JWT::ExpiredSignature, ArgumentError, TypeError
    nil
  end
end
