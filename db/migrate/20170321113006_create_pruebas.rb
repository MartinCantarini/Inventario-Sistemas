class CreatePruebas < ActiveRecord::Migration[5.0]
  def change
    create_table :pruebas do |t|
      t.string :nombre
      t.references :printer, foreign_key: true

      t.timestamps
    end
  end
end
