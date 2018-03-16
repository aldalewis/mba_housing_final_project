class Rental < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :rent_amount, :presence => { :message => "Rent amount can't be blank" }

end
