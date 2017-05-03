class Order < ApplicationRecord
  belongs_to :office
  validates :fecha, :office_id, presence: true
  validates :finalizado, inclusion: { in: [ true, false ] }
  has_attached_file :file, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/no_image/no_attachment.png", url: "/images/orden/:id/:style/orden.png"
  validates_attachment_content_type :file, content_type: /\Aimage\/.*\z/
  
  def self.search(q)
	  where("office_id = ?",q)
  end	
end
