class DefaultAIdUsuarioFavor < ActiveRecord::Migration
  def change
  	change_column :favors, :usuario_id, :integer, default: -1
  end
end
