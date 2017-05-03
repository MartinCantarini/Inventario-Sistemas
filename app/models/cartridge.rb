class Cartridge < ApplicationRecord
	belongs_to :brand
	belongs_to :model
	belongs_to :printer, optional: true
	belongs_to :purchase, optional:true
	has_many :recharges
	validates :model_id,:brand_id,:fecha_entrada,:estado,:fecha_estado,:color, presence: true
	validates :original, inclusion: { in: [ true, false ] }

	#USADO EN EL SHOW DE PRINTER
	def self.getIdCartuchos(impresora_id)
		cartucho_ids=Array.new
    	cartuchos=Cartridge.where('printer_id = ?',impresora_id)
    	cartuchos.all.each do |c|
          	cartucho_ids.push c.id
        end   
    	return cartucho_ids
	end
	#USADOS EN EL INDEX DE MODELS	
	def self.cantidad_recargando_total
		return Cartridge.where({estado: 'recargando'}).size
	end
	def self.cantidad_total
		return Cartridge.all.size
	end
	def self.cantidad_libres_total
		estado1='libre'
		estado2='nuevo'
		return where("estado = ? OR estado =?",estado1,estado2).size
	end
	def self.cantidad_total_id(id)
		return Cartridge.where("model_id = ?",id).size
	end
	def self.cantidad_libres(id)
		return Cartridge.where({model_id: id , estado: 'libre'}).size
	end
	def self.cantidad_usando(id)
		return Cartridge.where({model_id: id , estado: 'usando'}).size
	end	
	def self.cantidad_recargando(id)
		return Cartridge.where({model_id: id , estado: 'recargando'}).size
	end	
	def self.cantidad_nuevos(id)
		return Cartridge.where({model_id: id , estado: 'nuevo'}).size
	end
	def self.cantidad_originales(id)
		return Cartridge.where({model_id: id , original: true}).size
	end
	def self.cantidad_alternativos(id)
		return Cartridge.where({model_id: id , original: false}).size
	end
	def self.cantidad_impresoras_usan_cartucho(id)
		cant=0
		Cartridge.all.each do |c|
			if(c.model_id==id && c.printer_id!=0) 
				cant=cant+1
		    end
		end	
		return cant
	end
	#END----------------------------
	
	#USADOS EN EL INDEX DE MODELS
	def self.cantidad_total_fecha(id,fecha_desde,fecha_hasta)
		where("model_id = ? AND fecha_entrada BETWEEN ? AND ?",id,fecha_desde,fecha_hasta).size
	end
	def self.cantidad_libres_fecha(id,fecha_desde,fecha_hasta)
		estado='libre'
		where("model_id = ? AND estado = ? AND fecha_estado BETWEEN ? AND ?",id,estado,fecha_desde,fecha_hasta).size
	end
	def self.cantidad_usando_fecha(id,fecha_desde,fecha_hasta)
		estado='usandos'
		where("model_id = ? AND estado = ? AND fecha_estado BETWEEN ? AND ?",id,estado,fecha_desde,fecha_hasta).size
	end
	def self.cantidad_recargando_fecha(id,fecha_desde,fecha_hasta)
		estado='recargando'
		where("model_id = ? AND estado = ? AND fecha_estado BETWEEN ? AND ?",id,estado,fecha_desde,fecha_hasta).size
	end
	def self.cantidad_nuevos_fecha(id,fecha_desde,fecha_hasta)
		estado='nuevo'
		where("model_id = ? AND estado = ? AND fecha_estado BETWEEN ? AND ?",id,estado,fecha_desde,fecha_hasta).size	
	end	
	def self.cantidad_comprados_fecha(id,fecha_desde,fecha_hasta)
		where("model_id = ? AND fecha_entrada BETWEEN ? AND ?",id,fecha_desde,fecha_hasta).size
	end
	def self.cantidad_originales_fecha(id,fecha_desde,fecha_hasta)
		where("model_id = ? AND original = ? AND fecha_entrada BETWEEN ? AND ?",id,true,fecha_desde,fecha_hasta).size
	end
	def self.cantidad_alternativos_fecha(id,fecha_desde,fecha_hasta)
		where("model_id = ? AND original = ? AND fecha_entrada BETWEEN ? AND ?",id,false,fecha_desde,fecha_hasta).size
	end
	#END----------------------------

	#USADO EN EL INDEX DE CARTRIDGES
	def self.busqueda_fecha_entrada(fecha_desde,fecha_hasta)
  		where("fecha_entrada BETWEEN ? AND ?",fecha_desde,fecha_hasta)
	end
	#A) Cant. de cartuchos comprados en una fecha
	def self.cantidad_fecha_entrada(fecha_desde,fecha_hasta)
  		where("fecha_entrada BETWEEN ? AND ?",fecha_desde,fecha_hasta).size
	end
	#B) Cant. de cartuchos recargando en una fecha
	def self.cantidad_fecha_estado_recargando(fecha_desde,fecha_hasta)
  		estado='recargando'
  		where("estado = ? AND fecha_estado BETWEEN ? AND ?",estado,fecha_desde,fecha_hasta).size
	end
	#C) Cant. de cartuchos disponibles en una fecha
    def self.cantidad_fecha_estado_libre(fecha_desde,fecha_hasta)
  		estado1='libre'
		estado2='nuevo'
  		where("estado = ? OR estado = ? AND fecha_estado BETWEEN ? AND ?",estado1,estado2,fecha_desde,fecha_hasta).size
	end
	def getOficina
		id_impresora=self.printer_id
		impresora=Printer.find(id_impresora)
		return Office.find(impresora.office_id).nombre_departamento
	end	
	#END----------------------------
end