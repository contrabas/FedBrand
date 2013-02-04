class AddRatingsToMonth < ActiveRecord::Migration
  def change
    add_column :months, :ratings, :string
  end
end
