class AddSubletCountToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :sublets_count, :integer
  end
end
