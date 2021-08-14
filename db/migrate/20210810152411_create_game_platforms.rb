class CreateGamePlatforms < ActiveRecord::Migration[5.2]
    def change
      create_table :game_platforms do |t|
        t.belongs_to :game_id, foreign_key: true
        t.belongs_to :platform_id, foreign_key: true        
      end
    end
  end