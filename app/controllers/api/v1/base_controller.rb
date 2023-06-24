class Api::V1::BaseController < ActionController::Base
  HMAC_SECRET = Rails.application.credentials.dig(:jwt, :hmac_secret)
  skip_before_action :verify_authenticity_token
  before_action :verify_request
<<<<<<< HEAD

=======
>>>>>>> a71744be8e918612fa76efbcbf78bc4a91b731c1
  rescue_from StandardError,                with: :internal_server_error
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  private

  def not_found(exception)
    render json: { error: exception.message }, status: :not_found
  end

  def internal_server_error(exception)
    if Rails.env.development?
      response = { type: exception.class.to_s, error: exception.message }
    else
      response = { error: "Internal Server Error" }
    end
    render json: response, status: :internal_server_error
  end

  def render_error
    render json: { errors: @story.errors.full_messages },
      status: :unprocessable_entity
  end

  def verify_request
    token = get_jwt_token
    if token.present?
      data = jwt_decode(token)
      user_id = data[:user_id]
<<<<<<< HEAD
      @current_user = User.find(user_id)
=======
      @current_user = User.find(user_id) # set current user by user_id in JWT payload
>>>>>>> a71744be8e918612fa76efbcbf78bc4a91b731c1
    else
      render json: { error: 'Missing JWT token.' }, status: 401
    end
  end

<<<<<<< HEAD
  def jwt_decode(token)
=======
  def jwt_decode(token) # decode JWT, then turn payload into a hash
>>>>>>> a71744be8e918612fa76efbcbf78bc4a91b731c1
    decoded_info = JWT.decode(token, HMAC_SECRET, { algorithm: 'HS256' })[0] # extract the payload
    HashWithIndifferentAccess.new decoded_info
  end

<<<<<<< HEAD
  def get_jwt_token
    request.headers['X-USER-TOKEN']
  end
end
=======
  def get_jwt_token # retrieve token from headers
    request.headers['X-USER-TOKEN']
  end
>>>>>>> a71744be8e918612fa76efbcbf78bc4a91b731c1
end
