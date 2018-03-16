class SavedRental < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :rental_id, :presence => true

  validates :user_id, :presence => true

end
