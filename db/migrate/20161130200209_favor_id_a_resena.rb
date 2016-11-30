class FavorIdAResena < ActiveRecord::Migration
  def change
  	add_column :resenas, :favor_id, :integer
  end
end
