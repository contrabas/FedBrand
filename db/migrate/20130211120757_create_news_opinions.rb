class CreateNewsOpinions < ActiveRecord::Migration
  def change
    create_table :news_opinions do |t|
      t.integer :news_id
      t.integer :opinion_id

      t.timestamps
    end
  end
end
