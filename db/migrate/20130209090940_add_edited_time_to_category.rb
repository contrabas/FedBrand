class AddEditedTimeToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :edited_time, :datetime
    add_column :categories, :slug, :string
  end
end
