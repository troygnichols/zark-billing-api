class ApplicationMailer < ActionMailer::Base
  default from: 'Zark Billing <no-reply@zark-billing-api.herokuapp.com>'
  layout 'mailer'
end

