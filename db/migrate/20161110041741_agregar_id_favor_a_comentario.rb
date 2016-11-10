class AgregarIdFavorAComentario < ActiveRecord::Migration
  def change
  	add_column :comentarios, :favor_id, :integer
  end
end
