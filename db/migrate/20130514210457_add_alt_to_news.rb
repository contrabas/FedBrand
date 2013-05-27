class AddAltToNews < ActiveRecord::Migration
  def change
    add_column :news, :alt, :string
  end
end
