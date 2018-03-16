class Rental < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :name, :presence => { :message => "Name Can't be Blank" }

  validates :rent_amount, :presence => { :message => "Rent amount can't be blank" }

end
