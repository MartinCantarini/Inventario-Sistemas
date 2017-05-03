class Purchase < ApplicationRecord
	validates :fecha,:lugar, presence: true
  	has_attached_file :factura, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/no_image/no_attachment.png", url: "/images/facturas/:id/:style/factura.png"
    validates_attachment_content_type :factura, content_type: /\Aimage\/.*\z/
	
	def compra_con_fecha
	    "#{id} (#{fecha})"
  	end
end