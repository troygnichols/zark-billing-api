ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...

  def authorize(email, password)
    cmd = AuthenticateUser.call(email, password)
    raise 'Auth failed' unless cmd.success?
    request.headers['Authorization'] = cmd.result[:token]
  end

end
