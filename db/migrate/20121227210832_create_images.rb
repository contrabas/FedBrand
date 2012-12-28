class CreateImages < ActiveRecord::Migration
  def up
    create_table :images do |t|
      t.integer :gallery_id
      t.string :file
      t.string :title
      t.text :description

      t.timestamps
    end
    Image.create_translation_table! title: :string, description: :text
  end

  def down
    drop_table :images
    Image.drop_translation_table!
  end
end
