class CreateResenas < ActiveRecord::Migration
  def change
    create_table :resenas do |t|
      t.boolean :cumplido
      t.string :descripcion

      t.timestamps null: false
    end
  end
end
