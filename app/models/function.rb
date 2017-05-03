class Function < ApplicationRecord
	has_and_belongs_to_many :printers
	validates :funcion, presence: true
end
