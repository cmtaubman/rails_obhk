class CreateBars < ActiveRecord::Migration
  def change
    create_table :bars do |t|
      t.string  :name
      t.string  :location
      t.string  :address
      t.integer :startTime
      t.integer :endTime
      t.string  :features
      t.string  :day
      # ARRAY ???
      t.string  :beverage
      # ARRAY ???
      t.integer :price
      t.string  :image
      t.string  :imageTwo
      t.string  :deal

      t.timestamps null: false
    end
  end
end
