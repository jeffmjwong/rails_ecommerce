class AddAvgratingToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :avgrating, :float
  end
end
