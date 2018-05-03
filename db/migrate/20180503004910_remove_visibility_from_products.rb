class RemoveVisibilityFromProducts < ActiveRecord::Migration[5.1]
  def change
    remove_column :products, :visibility, :boolean
  end
end
