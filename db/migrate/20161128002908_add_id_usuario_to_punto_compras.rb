class AddIdUsuarioToPuntoCompras < ActiveRecord::Migration
  def change
    add_column :punto_compras, :usuario_id, :integer, default: -1
  end
end
