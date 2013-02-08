class AddDefaultsToNews < ActiveRecord::Migration
  def change
    add_column :news, :actual, :boolean, default: true
    add_column :news, :edited_time, :datetime
    change_column :news, :online, :boolean, default: false
    change_column :news, :announcement, :boolean, default: false
    change_column :news, :published_by, :string, default: nil
  end
end
