class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_one :list, dependent: :destroy
  has_many :tasks, dependent: :destroy
  validates_uniqueness_of :username
end
