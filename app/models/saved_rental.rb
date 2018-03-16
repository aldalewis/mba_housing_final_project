class SavedRental < ApplicationRecord
  # Direct associations

  belongs_to :rental,
             :counter_cache => :bookmarks_count

  belongs_to :user,
             :counter_cache => true

  # Indirect associations

  # Validations

  validates :rental_id, :presence => true

  validates :user_id, :presence => true

end
