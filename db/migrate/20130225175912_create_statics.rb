class CreateStatics < ActiveRecord::Migration
  def change
    create_table :statics do |t|
      t.string :name
      t.text :content_ru
      t.text :content_en

      t.timestamps
    end
  end
end
