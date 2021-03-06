class CreateExperts < ActiveRecord::Migration
  def up
    create_table :experts do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :photo
      t.integer :category_id
      t.integer :partner_id
      t.text :description
      t.text :position
      t.string :post
      t.string :workplace

      t.timestamps
    end
    Expert.create_translation_table! first_name: :string, middle_name: :string,
      last_name: :string, description: :text, position: :text,post: :string, 
      workplace: :string
  end

  def down
    drop_table :experts
    Expert.drop_translation_table!
  end
end
