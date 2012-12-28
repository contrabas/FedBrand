class CreateExperts < ActiveRecord::Migration
  def up
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
    Expert.create_translation_table! name: :string, description: :text, position: :text,
      post: :string, workplace: :string
  end

  def down
    drop_table :experts
    Expert.drop_translation_table!
  end
end
