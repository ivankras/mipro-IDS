class EliminarAdmin < ActiveRecord::Migration
  def change
  	drop_table :administradors
  end
end
