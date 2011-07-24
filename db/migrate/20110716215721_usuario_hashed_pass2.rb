class UsuarioHashedPass2 < ActiveRecord::Migration
  def self.up
    drop_table :usuarios
    create_table :usuarios do |t|
      t.string :username
      t.string :hashed_password
      t.string :nombre
      t.string :email
      t.string :rol
      t.references :proyecto

      t.timestamps
    end
  end

  def self.down
    drop_table :usuarios
  end
end
