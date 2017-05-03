class Brand < ApplicationRecord
	validates :nombre, presence: true
	#Devuelve la marca que se corresponde con id
	def self.getMarca(id)
		marca=Brand.find(id)
		return marca.nombre
	end	
end
