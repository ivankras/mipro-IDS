class AgregarAUsuarioSexo < ActiveRecord::Migration
  def change
  	add_column :usuarios, :admin, :string, default: "I"
  end
end
