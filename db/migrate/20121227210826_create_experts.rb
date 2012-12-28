class CreateExperts < ActiveRecord::Migration
  def change
    create_table :experts do |t|
      t.integer :category_id
      t.string :photo
      t.string :name
      t.text :description
      t.text :position
      t.string :post
      t.string :workplace

      t.timestamps
    end
  end
end
