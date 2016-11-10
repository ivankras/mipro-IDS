class CreateFavors < ActiveRecord::Migration
  def change
    create_table :favors do |t|
      t.string :titulo
      t.string :foto_url
      t.string :descripcion
      t.string :ciudad
      t.integer :id_ofrecimiento_electo

      t.timestamps null: false
    end
  end
end
