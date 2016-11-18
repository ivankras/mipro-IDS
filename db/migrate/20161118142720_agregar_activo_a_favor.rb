class AgregarActivoAFavor < ActiveRecord::Migration
  def change
  	add_column :favors, :activo, :boolean, default: true
  end
end
