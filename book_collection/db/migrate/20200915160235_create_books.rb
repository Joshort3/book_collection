class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
        t.string "Title", :limit => 100
        t.string "Author", :limit => 100
        t.string "Genre", :limit => 25
        t.float "Price"
        t.date "Date"
      t.timestamps
    end
  end
end
