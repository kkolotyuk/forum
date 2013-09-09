class Message < ActiveRecord::Base
  belongs_to :topic
  attr_accessible :content
  validation :content, presence: true
end
