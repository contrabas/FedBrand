class CreateCategories < ActiveRecord::Migration
  def up
    create_table :categories do |t|
      t.string :name_ru
      t.string :name_en

      t.timestamps
    end
  end
end
