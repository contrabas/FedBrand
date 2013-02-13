class AddPhotoByHeightToxpert < ActiveRecord::Migration
  def change
    add_column :experts, :photo_by_height, :string
  end
end
