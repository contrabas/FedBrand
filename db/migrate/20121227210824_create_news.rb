class CreateNews < ActiveRecord::Migration
  def up
    create_table :news do |t|
      t.string :logo
      t.string :title
      t.text :content
      t.integer :region_id
      t.integer :category_id
      t.integer :award_id
      t.boolean :announcement
      t.boolean :online
      t.string :published_by
      t.string :publish_url

      t.timestamps
    end
    News.create_translation_table! content: :text, title: :string, 
      published_by: :string
  end

  def down
    drop_table :news
    News.drop_translation_table!
  end
end
