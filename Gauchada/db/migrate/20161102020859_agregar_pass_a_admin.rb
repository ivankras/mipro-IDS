class AgregarPassAAdmin < ActiveRecord::Migration
  def change
  	add_column :administradors, :contrasena, :string
  end
end
