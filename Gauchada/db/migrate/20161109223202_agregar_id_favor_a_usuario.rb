class AgregarIdFavorAUsuario < ActiveRecord::Migration
  def change
  	add_column :usuarios, :favor_id, :integer
  end
end
