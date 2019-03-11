class Fleet < ApplicationRecord
	belongs_to :client
	belongs_to :person
end
