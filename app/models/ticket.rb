class Ticket < ApplicationRecord
	has_one :ticket_type
	belongs_to :client
  belongs_to :person
  belongs_to :fleet, optional: true
  belongs_to :user
  has_one :assigned, :class_name => 'Person', :foreign_key => 'assigned_to'
  has_many :ticket_answers
end
