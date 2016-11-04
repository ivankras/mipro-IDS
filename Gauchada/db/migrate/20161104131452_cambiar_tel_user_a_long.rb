class CambiarTelUserALong < ActiveRecord::Migration
  def change
  	change_column :usuarios, :telefono , :long
  end
end
