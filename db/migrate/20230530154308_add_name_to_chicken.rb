class AddNameToChicken < ActiveRecord::Migration[7.0]
  def change
    add_column :chickens, :name, :string
  end
end
