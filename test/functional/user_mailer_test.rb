require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "bohconf_session_submitted" do
    mail = UserMailer.bohconf_session_submitted
    assert_equal "Bohconf session submitted", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
