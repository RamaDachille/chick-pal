class AddCoordinatesToChickens < ActiveRecord::Migration[7.0]
  def change
    add_column :chickens, :latitude, :float
    add_column :chickens, :longitude, :float
  end
end
