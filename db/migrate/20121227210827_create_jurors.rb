class CreateJurors < ActiveRecord::Migration
  def change
    create_table :jurors do |t|
      t.integer :expert_id
      t.integer :award_id

      t.timestamps
    end
  end
end
