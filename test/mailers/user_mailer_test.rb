require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "knockout_stage" do
    mail = UserMailer.knockout_stage
    assert_equal "Knockout stage", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
