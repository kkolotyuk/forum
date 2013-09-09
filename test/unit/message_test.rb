require 'test_helper'

class MessageTest < ActiveSupport::TestCase

  test "message with empty content" do
    message = Message.new()

    assert message.invalid?
    assert message.errors[:content].any?
    assert message.errors[:topic].any?
  end
end
