class CambiarSexoUsuarioABoolean < ActiveRecord::Migration
  def change
  	#Se define TRUE para Femenino & FALSE para Masculino
  	change_column :usuarios, :sexo , :boolean, default: true
  end
end
