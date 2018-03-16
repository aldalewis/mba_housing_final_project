require 'open-uri'
class Rental < ApplicationRecord
  before_validation :geocode_address

  def geocode_address
    if self.address.present?
      url = "http://maps.googleapis.com/maps/api/geocode/json?address=#{URI.encode(self.address)}"

      raw_data = open(url).read

      parsed_data = JSON.parse(raw_data)

      if parsed_data["results"].present?
        self.address_latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]

        self.address_longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]

        self.address_formatted_address = parsed_data["results"][0]["formatted_address"]
      end
    end
  end
  mount_uploader :image, ImageUploader

  # Direct associations

  has_many   :bookmarks,
             :class_name => "SavedRental",
             :dependent => :destroy

  belongs_to :sublettor,
             :class_name => "User",
             :foreign_key => "user_id",
             :counter_cache => :sublets_count

  # Indirect associations

  # Validations

  validates :address, :uniqueness => true

  validates :address, :presence => { :message => "Address can't be blank" }

  validates :date_available, :presence => { :message => "Date Available can't be blank" }

  validates :end_date, :presence => { :message => "End Date can't be blank" }

  validates :name, :uniqueness => { :scope => [:address], :message => "Address has already been registered" }

  validates :name, :presence => { :message => "Name Can't be Blank" }

  validates :rent_amount, :presence => { :message => "Rent amount can't be blank" }

end
