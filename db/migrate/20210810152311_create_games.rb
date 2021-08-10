class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :title
      t.string :description
      t.integer :genre_id
    end
  end
end

# t.belongs_to :genre, foreign_key: true