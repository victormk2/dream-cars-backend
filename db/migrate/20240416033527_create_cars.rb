class CreateCars < ActiveRecord::Migration[7.1]
  def change
    create_table :cars do |t|
      t.string :model
      t.integer :year
      t.boolean :active, default: true
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
