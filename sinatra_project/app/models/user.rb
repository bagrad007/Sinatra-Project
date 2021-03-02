class User < ActiveRecord::Base
  has_secure_password
  validates_uniqueness_of :username
  validates_presence_of :username
  has_many :muppets
end
