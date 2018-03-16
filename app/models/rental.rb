class Rental < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :name, :uniqueness => { :scope => [:address], :message => "Address has already been registered" }

  validates :name, :presence => { :message => "Name Can't be Blank" }

  validates :rent_amount, :presence => { :message => "Rent amount can't be blank" }

end
