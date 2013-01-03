class RemoveExpertIdFromPartner < ActiveRecord::Migration
  def up
    remove_column :partners, :expert_id
  end

  def down
    add_column :partners, :expert_id, :integer
  end
end
