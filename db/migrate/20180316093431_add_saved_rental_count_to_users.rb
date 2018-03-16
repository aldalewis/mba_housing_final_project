class AddSavedRentalCountToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :saved_rentals_count, :integer
  end
end
