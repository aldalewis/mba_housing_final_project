class CreateSavedRentals < ActiveRecord::Migration
  def change
    create_table :saved_rentals do |t|
      t.integer :rental_id
      t.integer :user_id
      t.text :notes

      t.timestamps

    end
  end
end
