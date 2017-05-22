class Model < ApplicationRecord
	validates :nombre, presence: true
	def self.busqueda_modelo(search)
  		where("nombre LIKE ?", "%#{search}%")
	end
	def self.getNombre(id_modelo)
		return Model.find(id_modelo).nombre
	end
end
