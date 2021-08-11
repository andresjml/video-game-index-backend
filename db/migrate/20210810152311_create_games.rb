class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :title
      t.string :description
      t.belongs_to :genre, foreign_key: true
    end
  end
end

