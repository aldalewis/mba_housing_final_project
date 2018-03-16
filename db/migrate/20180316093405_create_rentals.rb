class CreateRentals < ActiveRecord::Migration
  def change
    create_table :rentals do |t|
      t.string :name
      t.string :address
      t.string :image
      t.text :description
      t.string :feature
      t.float :rent_amount
      t.date :date_available
      t.date :end_date
      t.integer :user_id
      t.string :roommates

      t.timestamps

    end
  end
end
