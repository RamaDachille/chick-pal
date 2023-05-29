class AddDescriptioToChicken < ActiveRecord::Migration[7.0]
  def change
    add_column :chickens, :description, :text
  end
end
