class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :lists, dependent: :destroy
  has_many :tasks, dependent: :destroy
end
