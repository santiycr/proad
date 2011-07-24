class CreateProyectos < ActiveRecord::Migration
  def self.up
    create_table :proyectos do |t|
      t.string :nombre
      t.string :descripcion
      t.date :fecha_comienzo
      t.date :fecha_entrega
      t.integer :duracion_sprint

      t.timestamps
    end
  end

  def self.down
    drop_table :proyectos
  end
end
