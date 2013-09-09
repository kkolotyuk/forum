class Topic < ActiveRecord::Base
  attr_accessible :title
  has_many :messages
  validates :title, presence: true, length: { maximum: 255 }
end
