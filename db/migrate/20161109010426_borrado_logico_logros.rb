class BorradoLogicoLogros < ActiveRecord::Migration
  def change
  	add_column :logros, :activo , :boolean , default: true
  end
end
