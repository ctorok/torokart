class CreateArtsTable < ActiveRecord::Migration
   def change
    create_table :arts do |t|
      t.string :name
      t.string :picfile
      t.string :type_art
      t.integer :year
      t.timestamps
      t.integer :artist_id
      t.integer :tag_id
    end
  end
end
