class User < ApplicationRecord
  acts_as_paranoid
  has_many :delivery_addresses
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
