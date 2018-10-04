class CreateTvShows < ActiveRecord::Migration[5.2]
  def change
    create_table :tv_shows do |t|
      t.string :name
      t.date :first_air
      t.float :rating
      t.string :genre
      t.text :overview
      t.string :poster_path
      t.string :backdrop_path
      t.string :homepage
      t.string :creator
      t.integer :seasons
      t.integer :episodes
      t.integer :run_time
      t.string :network
      t.integer :tv_id

      t.timestamps
    end
    add_index :tv_shows, :name
    add_index :tv_shows, :tv_id
  end
end
