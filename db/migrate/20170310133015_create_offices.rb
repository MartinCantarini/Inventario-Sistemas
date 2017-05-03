class CreateOffices < ActiveRecord::Migration[5.0]
  def change
    create_table :offices do |t|
      t.string :nombre_encargado
      t.references :department, foreign_key: true
      t.references :direction, foreign_key: true

      t.timestamps
    end
  end
end
