class CreateNominees < ActiveRecord::Migration
  def up
    create_table :nominees do |t|
      t.integer :region_id
      t.integer :nomination_id
      t.date :date
      t.text :description

      t.timestamps
    end
    Nominee.create_translation_table! description: :text
  end
  def down
    drop_table :nominees
    Nominee.drop_translation_table!
  end
end
