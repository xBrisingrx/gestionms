class Person < ApplicationRecord
  belongs_to :client
  belongs_to :person_type
  has_many :tickets
  has_many :fleets
  # has_many :assigned_tickets, :class_name => 'Ticket', :foreign_key => 'assigned_to' 
  # has_one :user
	validates :name, presence: true,
						length: { minimum: 3 }
	validates :person_type, presence: true
end
