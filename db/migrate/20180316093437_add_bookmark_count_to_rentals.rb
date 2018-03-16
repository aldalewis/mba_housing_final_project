class AddBookmarkCountToRentals < ActiveRecord::Migration[5.0]
  def change
    add_column :rentals, :bookmarks_count, :integer
  end
end
