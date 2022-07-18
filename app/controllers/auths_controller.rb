class AuthsController < ApplicationController
    def create
        hmac_secret = '1n0v4g1s3ll3'
        payload = {name: params[:name]}
        token = JWT.encode payload, hmac_secret, 'HS256'
        render json: {token: token}
    end
end
