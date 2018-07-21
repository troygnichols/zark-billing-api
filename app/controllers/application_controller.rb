class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  before_action :allow_cross_site_requests

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

end
