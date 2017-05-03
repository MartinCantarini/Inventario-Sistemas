class Direction < ApplicationRecord
validates :nombre, presence: true
def self.getNombreDireccion(id)
	d=where(id: id).first
	return d.nombre
end
end
