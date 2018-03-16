class AddAddressFormattedAddressToRental < ActiveRecord::Migration[5.0]
  def change
    add_column :rentals, :address_formatted_address, :string
  end
end
