class AddSlugToExperts < ActiveRecord::Migration
  def change
    add_column :experts, :slug, :string
  end
end
