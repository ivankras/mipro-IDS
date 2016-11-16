class AgregarIdUsuarioAFavor < ActiveRecord::Migration
  def change
  	add_column :favors, :usuario_id, :integer
  end
end
