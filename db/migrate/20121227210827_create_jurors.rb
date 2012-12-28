class CreateJurors < ActiveRecord::Migration
  def change
    create_table :jurors do |t|
      t.integer :expert_id
      t.integer :nomination_id

      t.timestamps
    end
  end
end
