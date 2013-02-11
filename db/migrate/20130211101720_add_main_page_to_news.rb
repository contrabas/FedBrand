class AddMainPageToNews < ActiveRecord::Migration
  def change
    add_column :news, :main_page, :boolean, default: true
  end
end
