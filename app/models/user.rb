class User < ApplicationRecord
  # Direct associations

  has_many   :saved_rentals,
             :dependent => :destroy

  has_many   :sublets,
             :class_name => "Rental",
             :dependent => :destroy

  # Indirect associations

  # Validations

  validates :username, :uniqueness => true

  validates :username, :presence => true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
