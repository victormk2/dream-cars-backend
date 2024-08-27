class CreateEngines < ActiveRecord::Migration[7.1]
  def change
    create_table :engines do |t|
      t.string :model
      t.string :description
      t.integer :year
      t.integer :cylinders
      t.boolean :active, default: true
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
