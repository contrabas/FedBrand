class CreateOpinions < ActiveRecord::Migration
  def up
    create_table :opinions do |t|
      t.integer :expert_id
      t.text :content

      t.timestamps
    end
    Opinion.create_translation_table! content: :text
  end
  def down
    drop_table :opinions
    Opinion.drop_translation_table!
  end
end
