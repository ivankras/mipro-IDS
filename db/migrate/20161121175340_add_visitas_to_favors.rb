class AddVisitasToFavors < ActiveRecord::Migration
  def change
    add_column :favors, :visitas, :integer, default: 0
  end
end
