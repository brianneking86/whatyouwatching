class CreateShows < ActiveRecord::Migration
  def change
    create_table :shows do |t|
      t.string :title
      t.string :plot
      t.string :url
      t.string :genre
      t.string :poster
      t.string :tagline

      t.timestamps
    end
  end
end
