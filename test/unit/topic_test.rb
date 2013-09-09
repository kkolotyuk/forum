require 'test_helper'

class TopicTest < ActiveSupport::TestCase

  test "topic with empty title" do
    topic = Topic.new()

    assert topic.invalid?
    assert topic.errors[:title].any?
  end
end
