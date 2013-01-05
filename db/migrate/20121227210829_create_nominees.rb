class CreateNominees < ActiveRecord::Migration
  def up
    create_table :nominees do |t|
      t.integer :region_id
      t.integer :award_id
      t.integer :award_category_id
      t.date :date
      t.string :title
      t.text :description
      t.boolean :winner

      t.timestamps
    end
    Nominee.create_translation_table! description: :text, title: :string
  end
  def down
    drop_table :nominees
    Nominee.drop_translation_table!
  end
end
