class AddEditedTimeToOpinion < ActiveRecord::Migration
  def change
    add_column :opinions, :edited_time, :datetime
  end
end
