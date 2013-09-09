class Topic < ActiveRecord::Base
  attr_accessible :title
  has_many :messages
  validation :title, presence: true, length: { maximum: 255 }
end
