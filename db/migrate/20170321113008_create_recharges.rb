class CreateRecharges < ActiveRecord::Migration[5.0]
  def change
    create_table :recharges do |t|
      
      t.string :detalles
      t.string :lugar_recarga
      t.string :calle
      t.string :telefono
      t.date :fecha_recarga_inicio
      t.date :fecha_recarga_fin
      t.references :cartridge, foreign_key: true
      t.timestamps
    end
  end
end
