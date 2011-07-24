class CreateUsuarios < ActiveRecord::Migration
  def self.up
    create_table :usuarios do |t|
      t.string :nombre
      t.string :rol
      t.string :username
      t.string :password
      t.references :proyecto

      t.timestamps
    end
  end

  def self.down
    drop_table :usuarios
  end
end
