class CreateNominations < ActiveRecord::Migration
  def change
    create_table :nominations do |t|
      t.integer :year

      t.timestamps
    end
  end
end
