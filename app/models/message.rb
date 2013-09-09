class Message < ActiveRecord::Base
  belongs_to :topic
  attr_accessible :content
  validates :content, :topic, presence: true
end
