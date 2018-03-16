class AddAddressLatitudeToRental < ActiveRecord::Migration[5.0]
  def change
    add_column :rentals, :address_latitude, :float
  end
end
