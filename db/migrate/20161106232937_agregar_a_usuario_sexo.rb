class AgregarAUsuarioSexo < ActiveRecord::Migration
  def change
  	add_column :usuarios, :sexo, :string, default: "I"
  end
end
