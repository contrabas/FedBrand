class AddDefaultValueToPublishedByToNewsTranslations < ActiveRecord::Migration
  def change
    change_column :news_translations, :published_by, :string, default: ""
  end
end
