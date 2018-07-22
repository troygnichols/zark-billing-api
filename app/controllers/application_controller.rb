class ApplicationController < ActionController::API
  before_action :allow_cross_site_requests
  before_action :authenticate_request, except: [:cors_preflight]
  attr_reader :current_user

  def cors_preflight
    head :no_content
  end

  def allow_cross_site_requests
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Expose-Headers'] = 'ETag'
    headers['Access-Control-Allow-Methods'] = 'GET, POST, PATCH, PUT, DELETE, OPTIONS, HEAD'
    headers['Access-Control-Allow-Headers'] = '*,x-requested-with,Content-Type,If-Modified-Since,If-None-Match,x-api-hmac,x-api-key,Authorization'
    headers['Access-Control-Max-Age'] = '86400'
  end

  private

  def authenticate_request
    @current_user = AuthorizeApiRequest.call(request.headers).result
    render json: { error: 'Not Authorized' }, status: 401 unless @current_user
  end

end
