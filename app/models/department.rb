class Department < ApplicationRecord
validates :nombre, presence: true	
def self.getNombreDepartamento(id)
	d=where(id: id).first
	return d.nombre
end
end
