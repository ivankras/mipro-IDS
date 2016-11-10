class AgregarIdLogroAUsuario < ActiveRecord::Migration
  def change
  	add_column :usuarios, :logro_id, :integer
  end
end
