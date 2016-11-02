class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.string :nombre
      t.string :apellido
      t.date :fecha_nacimiento
      t.string :email
      t.integer :telefono
      t.integer :puntos
      t.string :contrasena

      t.timestamps null: false
    end
  end
end
