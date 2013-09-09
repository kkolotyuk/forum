class Topic < ActiveRecord::Base
  attr_accessible :title
  has_many :messages, dependent: :destroy
  validates :title, presence: true, length: { maximum: 255 }
end
