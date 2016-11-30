class CambiarNombreColumnaOfrecimientoElecto < ActiveRecord::Migration
  def change
  	rename_column :favors, :id_ofrecimiento_electo, :ofrecimiento_electo_id
  end
end
