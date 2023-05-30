class CreateChickens < ActiveRecord::Migration[7.0]
  def change
    create_table :chickens do |t|
      t.integer :age
      t.string :breed
      t.integer :egg_capacity
      t.string :gender
      t.string :noise_level
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
