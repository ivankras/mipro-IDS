class BorrarFavorIdDeUsuario < ActiveRecord::Migration
  def change
  	remove_column :usuarios, :favor_id
  end
end
