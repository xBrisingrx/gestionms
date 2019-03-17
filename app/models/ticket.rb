class Ticket < ApplicationRecord
	belongs_to :ticket_type
	belongs_to :ticket_status
	belongs_to :client
  belongs_to :person
  belongs_to :fleet, optional: true
  belongs_to :user
  belongs_to :assigned, :class_name => 'Person', :foreign_key => 'assigned_to', optional: true
  has_many :ticket_answers
end
