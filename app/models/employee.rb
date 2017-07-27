class Employee < ApplicationRecord
	belongs_to :game, optional: true
	validates :type_of_work, presence: true
	ROLES = ['designer', 'illustrator', 'writer', 'composer', 'developer']
end
