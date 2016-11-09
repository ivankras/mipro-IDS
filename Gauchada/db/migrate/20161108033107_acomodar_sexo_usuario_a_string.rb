class AcomodarSexoUsuarioAString < ActiveRecord::Migration
  def change
  	remove_column :usuarios, :sexo 
  	add_column :usuarios, :sexo , :string , default: "femenino"
  end
end
