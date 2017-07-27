class Office < ApplicationRecord

  belongs_to :department
  belongs_to :direction
  validates :direction_id, :department_id, :nombre_encargado, presence: true
  has_many :printers

  def departamento_con_direccion
  	departamento=Department.find(department_id)
  	direccion=Direction.find(direction_id)
    "#{departamento.nombre} (#{direccion.nombre})"
  end
  def nombre_departamento
    departamento=Department.find(department_id)
    "#{departamento.nombre}"
  end
  def self.getNombreOficina(id)
  	id_departamento = Office.find(id).department_id
  	id_direccion = Office.find(id).direction_id
  	nombre_departamento = Department.find(id_departamento).nombre
  	nombre_direccion = Direction.find(id_direccion).nombre
  	return "#{nombre_departamento} (#{nombre_direccion})"
  end
  def self.getDepartamentoUsandoToner(modelo_id)
    departamentos=Array.new
    cartuchos=Cartridge.where('model_id = ? AND printer_id != ?',modelo_id,1)
    cartuchos.all.each do |c|
      Printer.all.each do |p|
        if c.printer_id==p.id
          oficina=Office.find(p.office_id)
          departamentos.push Department.find(oficina.department_id).nombre
        end
      end
    end
    return departamentos
  end
end
