class ApplicationMailer < ActionMailer::Base
  default from: 'no-reply@zark-billing.herokuapp.com'
  layout 'mailer'
end

