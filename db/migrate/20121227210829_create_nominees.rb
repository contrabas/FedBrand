class CreateNominees < ActiveRecord::Migration
  def change
    create_table :nominees do |t|
      t.integer :region_id
      t.integer :nomination_id
      t.date :date
      t.text :description

      t.timestamps
    end
  end
end
