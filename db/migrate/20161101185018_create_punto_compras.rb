class CreatePuntoCompras < ActiveRecord::Migration
  def change
    create_table :punto_compras do |t|
      t.integer :cantidad
      t.float :precio_total

      t.timestamps null: false
    end
  end
end
