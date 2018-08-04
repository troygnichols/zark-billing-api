require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "account_activation" do
    user = users(:one)
    mail = UserMailer.account_activation(user)
    assert_equal "Account activation", mail.subject
    assert_equal [user.email], mail.to
    assert_equal ["no-reply@zark-billing-api.herokuapp.com"], mail.from
    assert_match "Activate", mail.body.encoded
  end

  test "password_reset" do
    mail = UserMailer.password_reset
    assert_equal "Password reset", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["no-reply@zark-billing-api.herokuapp.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
