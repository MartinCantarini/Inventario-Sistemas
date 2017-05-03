class Recharge < ApplicationRecord
	belongs_to :cartridge
	validates :cartridge_id,:lugar_recarga,:fecha_recarga_inicio,presence: true
	def self.getCantRecargas(id)
		return Recharge.where(:cartridge_id=>id).size
	end	
end
