class CreateTareas < ActiveRecord::Migration
  def self.up
    create_table :tareas do |t|
      t.string :titulo
      t.text :descripcion
      t.integer :porcentaje_avance
      t.integer :horas_dedicadas
      t.references :userstory

      t.timestamps
    end
  end

  def self.down
    drop_table :tareas
  end
end
