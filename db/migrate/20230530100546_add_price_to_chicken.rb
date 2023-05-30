class AddPriceToChicken < ActiveRecord::Migration[7.0]
  def change
    add_column :chickens, :price, :integer
  end
end
