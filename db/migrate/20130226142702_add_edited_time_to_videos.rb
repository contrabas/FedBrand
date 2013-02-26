class AddEditedTimeToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :edited_time, :datetime
  end
end
