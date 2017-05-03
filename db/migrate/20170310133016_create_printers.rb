class CreatePrinters < ActiveRecord::Migration[5.0]
  def change
    create_table :printers do |t|
      t.string :codigo
      t.string :modelo 
      t.string :detalles
      t.boolean :red_disponible
      t.string :numero_inventario
      t.references :brand, foreign_key: true
      t.references :office, foreign_key: true
      t.timestamps
    end
  end
end
