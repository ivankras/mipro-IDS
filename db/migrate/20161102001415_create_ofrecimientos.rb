class CreateOfrecimientos < ActiveRecord::Migration
  def change
    create_table :ofrecimientos do |t|
      t.string :descripcion
      t.date :fecha_limite

      t.timestamps null: false
    end
  end
end
