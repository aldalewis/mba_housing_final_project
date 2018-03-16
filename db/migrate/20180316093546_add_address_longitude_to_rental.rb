class AddAddressLongitudeToRental < ActiveRecord::Migration[5.0]
  def change
    add_column :rentals, :address_longitude, :float
  end
end
