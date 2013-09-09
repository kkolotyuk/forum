class Message < ActiveRecord::Base
  belongs_to :topic
  attr_accessible :content, :topic
  validates :content, :topic, presence: true
end
