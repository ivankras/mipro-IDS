class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.string :nombre
      t.string :apellido
      t.string :email
      t.date :fecha_nacimiento
      t.integer :telefono
      t.integer :puntos
      t.string :contrasena
      t.timestamps null: false
    end
  end
end
