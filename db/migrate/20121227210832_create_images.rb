class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.integer :gallery_id
      t.string :file
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
