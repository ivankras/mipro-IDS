class CambiarTelUserALong < ActiveRecord::Migration
  def change
  	change_column :usuarios, :telefono , :bigint
  end
end
