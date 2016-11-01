class CreateAdministradors < ActiveRecord::Migration
  def change
    create_table :administradors do |t|
      t.string :nombre
      t.string :apellido
      t.string :email

      t.timestamps null: false
    end
  end
end
