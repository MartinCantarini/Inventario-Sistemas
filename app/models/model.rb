class Model < ApplicationRecord
	validates :nombre, presence: true
	def self.busqueda_modelo(search)
  		where("nombre LIKE ?", "%#{search}%") 
	end
end
