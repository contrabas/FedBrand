class CreateOpinions < ActiveRecord::Migration
  def change
    create_table :opinions do |t|
      t.integer :expert_id
      t.text :content

      t.timestamps
    end
  end
end
