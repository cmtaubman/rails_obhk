class CreateBookmarks < ActiveRecord::Migration
  def change
    create_table :bookmarks do |t|
      # FROM THE BARS TABLE
      t.belongs_to :bar, index: true
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
  end
end
