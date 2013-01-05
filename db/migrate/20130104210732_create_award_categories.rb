class CreateAwardCategories < ActiveRecord::Migration
  def up
    create_table :award_categories do |t|
      t.string :title

      t.timestamps
    end
    AwardCategory.create_translation_table! title: :string
  end
  def down
    drop_table :award_categories
    AwardCategory.drop_translation_table!
  end
end
