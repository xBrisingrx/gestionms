class User < ApplicationRecord
	belongs_to :person
  has_many :tickets
  has_many :ticket_answers
  has_secure_password
  validates :email, presence: true, uniqueness: true
end
