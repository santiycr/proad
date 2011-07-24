class CreateUserstories < ActiveRecord::Migration
  def self.up
    create_table :userstories do |t|
      t.string :titulo
      t.text :descripcion
      t.integer :prioridad
      t.integer :sprint
      t.integer :complejidad
      t.references :proyecto
      t.references :usuario

      t.timestamps
    end
  end

  def self.down
    drop_table :userstories
  end
end
