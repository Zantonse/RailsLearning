require 'test_helper'

class NotifierTest < ActionMailer::TestCase
  test "email_friend" do
    article = articles(:welcome_to_rails)
    message = Notifier.email_friend(article, 'John Smith', 'dude@example.com')
    assert_equal "Interesting Article", mail.subject
    assert_equal ["dude@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
  end

end
