class Printer < ApplicationRecord
	has_and_belongs_to_many :functions
	belongs_to :brand
	has_many :cartridge
	belongs_to :office, optional: true
	validates :modelo,:brand_id, :function_ids, presence: true
	validates :red_disponible, inclusion: { in: [ true, false ] }
	def impresora_codigo_marcar_modelo
		marca=Brand.find(brand_id).nombre
		if modelo=='000000'
			"Ninguna"
		else
			"#{codigo} (#{marca} - #{modelo})"	
		end
	end	
	def self.cantidad(nombre)
		cant=0
		Printer.all.each do |i| 
			if(i.functions.where(:funcion=>nombre).size>0)
				cant+=1
			end	
		end	
		return cant
	end	
	#Cantidad de impresoras que usan un determinado modelo de cartucho
	def self.cantidad_impresora_cartucho(id_modelo_cartucho)
		cant=0
		Printer.all.each do |p|
			if p.cartridge.model_id==id_modelo_cartucho
				cant=cant+1
			end	
		end
		return cant	
	end	
	def self.getImpresoraDeOficina(oficina_id)
		where('office_id = ?',oficina_id)
	end	
	def getOficina
		return Office.find(self.office_id).nombre_departamento
	end	
end
