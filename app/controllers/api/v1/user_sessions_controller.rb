class UserSessionsController < ApplicationController
  def login
    code = params[:code]
    app_id = Rails.application.credentials.dig(:wechat, :app_id)
    app_secret = Rails.application.credentials.dig(:wechat, :app_secret)
    url = "https://api.weixin.qq.com/sns/jscode2session?appid=#{app_id}&secret=#{app_secret}&js_code=#{code}&grant_type=authorization_code"
    response = RestClient.get(url)

    response = JSON.parse(response.body)
    open_id = response["openid"]

    user =  User.find_or_create_by(open_id: open_id)

    payload = {user_id: user.id}
    token = JWT.encode(payload, HMAC_SECRET, 'HS256')
    render json: {
      headers: { "X-USER-TOKEN" => token },
      user: user
    }
  end
end
