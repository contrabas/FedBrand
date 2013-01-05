class CreateMonthlyExperts < ActiveRecord::Migration
  def change
    create_table :monthly_experts do |t|
      t.integer :expert_id
      t.integer :month_id

      t.timestamps
    end
  end
end
