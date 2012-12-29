class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.date :date
      t.integer :region_id
      t.integer :value

      t.timestamps
    end
  end
end
