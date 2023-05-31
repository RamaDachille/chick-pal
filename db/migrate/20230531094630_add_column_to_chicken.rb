class AddColumnToChicken < ActiveRecord::Migration[7.0]
  def change
    add_column :chickens, :address, :string
  end
end
