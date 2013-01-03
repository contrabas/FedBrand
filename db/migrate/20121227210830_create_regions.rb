class CreateRegions < ActiveRecord::Migration
  def change
    create_table :regions do |t|
      t.string :name_ru
      t.string :name_en
      t.string :emblem

      t.timestamps
    end
  end
end
