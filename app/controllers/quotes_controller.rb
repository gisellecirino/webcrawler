class QuotesController < ApplicationController
  include ActionController::HttpAuthentication::Token::ControllerMethods
  
  before_action :authenticate
  before_action :set_quote, only: %i[ show update destroy ]

  def search_tag    
    tag_search = params[:search]  
    tag = Tag.search(tag_search)   
    quotes = tag ? tag.quotes : nil
    options = {}
    options[:include] = QuoteSerializer::DEFAULT_INCLUDES
    render json: QuoteSerializer.new(quotes, options).serialized_json
  end    

  def authenticate   
    authenticate_or_request_with_http_token do |token, options|
      hmac_secret = '1n0v4g1s3ll3'
      JWT.decode token, hmac_secret, true, {:algorithm => 'HS256'}
    end      
  end
end
