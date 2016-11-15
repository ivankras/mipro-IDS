class CambiarDefaultPuntos < ActiveRecord::Migration
  def change
   	change_column :usuarios, :puntos, :integer, default: 1
  end
end
