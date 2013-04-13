#coding: utf-8
class AddTypeToPartner < ActiveRecord::Migration
  def change
    add_column :partners, :group, :string, default: 'Партнеры'
  end
end
