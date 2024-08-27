class AddEngineToCars < ActiveRecord::Migration[7.1]
  def change
    add_reference :cars, :engine, null: true, foreign_key: true
  end
end
