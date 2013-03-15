class ChangeRatingValueType < ActiveRecord::Migration
  def change
    change_table :ratings do |t|
      t.change :value, :float
    end
  end
end
