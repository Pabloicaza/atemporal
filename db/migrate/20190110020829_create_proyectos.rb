class CreateProyectos < ActiveRecord::Migration[5.2]
  def change
    create_table :proyectos do |t|
      t.string :nombre_proyecto
      t.string :tipo_proyecto
      t.string :ubicacion
      t.string :construccion
      t.string :terreno
      t.boolean :disponibilidad
      t.text :resumen

      t.timestamps
    end
  end
end
