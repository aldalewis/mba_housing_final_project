class Rental < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :address, :presence => { :message => "Address can't be blank" }

  validates :date_available, :presence => { :message => "Date Available can't be blank" }

  validates :end_date, :presence => { :message => "End Date can't be blank" }

  validates :name, :uniqueness => { :scope => [:address], :message => "Address has already been registered" }

  validates :name, :presence => { :message => "Name Can't be Blank" }

  validates :rent_amount, :presence => { :message => "Rent amount can't be blank" }

end
