class AtributosOfreciemiento < ActiveRecord::Migration
  def change
  	add_column :ofrecimientos, :usuario_id, :integer
  	add_column :ofrecimientos, :favor_id, :integer
  end
end
