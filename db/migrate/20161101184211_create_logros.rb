class CreateLogros < ActiveRecord::Migration
  def change
    create_table :logros do |t|
      t.string :nombre
      t.integer :puntaje_min
      t.integer :puntaje_max

      t.timestamps null: false
    end
  end
end
