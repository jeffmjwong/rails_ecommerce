class RemoveTimezoneFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :timezone, :string
  end
end
