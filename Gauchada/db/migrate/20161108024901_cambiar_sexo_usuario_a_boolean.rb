class CambiarSexoUsuarioABoolean < ActiveRecord::Migration
  def change
  	#Se define TRUE para Femenino & FALSE para Masculino
  	remove_column :usuarios, :sexo 
  	add_column :usuarios, :sexo , :boolean , default: true
  end
end
