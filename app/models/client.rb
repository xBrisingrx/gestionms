class Client < ApplicationRecord
	belongs_to :client_type
	belongs_to :iva_condition, required: false
	belongs_to :sale_condition, required: false

	has_many :people
	has_many :fleets
  has_many :computers
  has_many :tickets

	validates :name, presence: true, length: { minimum: 3 }, uniqueness: true
end
