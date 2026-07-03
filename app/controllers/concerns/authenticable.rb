module Authenticable
  extend ActiveSupport::Concern

  included do
    before_action :authorize_request, only: %i[create update destroy]
  end

  private

  def authorize_request
    header = request.headers['Authorization']
    token = header.split.last if header&.start_with?('Bearer ')
    decoded = JsonWebToken.decode(token)

    unless decoded && (@current_user = User.find_by(id: decoded[:user_id]))
      render json: { error: 'Unauthorized' }, status: :unauthorized
    end
  end

  attr_reader :current_user
end
