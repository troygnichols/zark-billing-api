class ApplicationMailer < ActionMailer::Base
  default from: 'no-reply@zark-billing-api.herokuapp.com'
  layout 'mailer'
end

