class AddEndedToAwards < ActiveRecord::Migration
  def change
    add_column :awards, :ended, :boolean
  end
end
