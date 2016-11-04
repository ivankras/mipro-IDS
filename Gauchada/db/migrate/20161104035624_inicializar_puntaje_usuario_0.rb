class InicializarPuntajeUsuario0 < ActiveRecord::Migration
  def change
  	change_column :usuarios, :puntos, :integer, default: 0
  end
end
