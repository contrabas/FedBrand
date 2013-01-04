class CreateVideos < ActiveRecord::Migration
  def up
    create_table :videos do |t|
      t.string :title
      t.string :thumb
      t.text :tag

      t.timestamps
    end
    Video.create_translation_table! title: :string
  end
  def down
    drop_table :videos
    Video.drop_translation_table!
  end
end
