class CreateComentarios < ActiveRecord::Migration
  def change
    create_table :comentarios do |t|
      t.string :descripcion
      t.string :respuesta

      t.timestamps null: false
    end
  end
end
