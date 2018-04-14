class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :quantity
      t.boolean :visibility, default: true
      t.float :unitprice

      t.timestamps
    end
  end
end
