class CreatePartners < ActiveRecord::Migration
  def change
    create_table :partners do |t|
      t.string :logo
      t.string :url
      t.integer :expert_id

      t.timestamps
    end
  end
end
