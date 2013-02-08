class ChangeDefaultValueForNewsPublishedBy < ActiveRecord::Migration
  def change
    change_column :news, :published_by, :string, default: ""
  end
end
