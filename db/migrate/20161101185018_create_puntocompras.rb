class CreatePuntocompras < ActiveRecord::Migration
  def change
    create_table :puntocompras do |t|
      t.integer :cantidad
      t.float :precio_total

      t.timestamps null: false
    end
  end
end
