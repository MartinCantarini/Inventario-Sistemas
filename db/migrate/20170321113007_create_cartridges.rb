class CreateCartridges < ActiveRecord::Migration[5.0]
  def change
    create_table :cartridges do |t|
      t.string :codigo
      t.string :estado
      t.boolean :original
      t.date :fecha_entrada
      t.date :fecha_estado
      t.string :color
      t.integer :cantidad_recargas
      t.references :printer, foreign_key: true, :null => true
      t.references :model, foreign_key: true
      t.references :brand, foreign_key: true
      t.references :purchase, foreign_key: true
      t.timestamps
    end
  end
end
