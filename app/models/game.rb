class Game < ActiveRecord::Base
    belongs_to :genre
    has_many :game_platforms
    has_many :platforms, :through => :game_platforms
end