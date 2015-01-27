class List < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :user
  has_many :tasks
  validates :name, presence: true
  default_scope { order('name') }
  
end
