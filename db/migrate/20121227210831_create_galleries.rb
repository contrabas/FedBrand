class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.integer :nomination_id

      t.timestamps
    end
  end
end
