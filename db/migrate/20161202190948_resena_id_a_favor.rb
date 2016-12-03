class ResenaIdAFavor < ActiveRecord::Migration
  def change
  	add_column :favors, :resena_id, :integer 
  end
end
