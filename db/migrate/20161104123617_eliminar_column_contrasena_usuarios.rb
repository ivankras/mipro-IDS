class EliminarColumnContrasenaUsuarios < ActiveRecord::Migration
  def change
  	remove_column :usuarios, :contrasena
  end
end
