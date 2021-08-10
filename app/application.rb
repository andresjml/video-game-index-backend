class Application

  def call(env)
    res = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path == '/genres' && req.get?
      genres=Genre.all
      return [
        200, 
        { 'Content-Type' => 'application/json' }, 
        [ genres.to_json ]
      ] 
    elsif req.path.match(/genres/) && req.get?
      id=req.path.split('/')[2]
      genre=Genre.find_by_id(id)
      if genre
        games=genre.games
        genre_resp = {
          name: genre.name,
          games:games
        }
        return [
          200, 
          { 'Content-Type' => 'application/json' }, 
          [ genre_resp.to_json ]
        ]
      else
        return [
          404, 
          { 'Content-Type' => 'application/json' }, 
          [ {error: "Genre not Found"}.to_json ]
        ]
      end 
    
    elsif req.path == '/games' && req.get?
      games=Game.all
      return [
        200, 
        { 'Content-Type' => 'application/json' }, 
        [ games.to_json ]
      ]    
    elsif req.path.match(/games/) && req.get?
      id=req.path.split('/')[2]
      game=Game.find_by_id(id)
      if game
        platforms=game.platforms
        game_resp = {
          title: game.title,
          description: game.description,
          genre:game.genre.name,
          platforms:platforms
        }
        return [
          200, 
          { 'Content-Type' => 'application/json' }, 
          [ game_resp.to_json ]
        ]
      else
        return [
          404, 
          { 'Content-Type' => 'application/json' }, 
          [ {error: "Game not Found"}.to_json ]
        ]
      end 
    elsif req.path == '/platforms' && req.get?
      platforms=Platform.all
      return [
        200, 
        { 'Content-Type' => 'application/json' }, 
        [ platforms.to_json ]
      ]    
    elsif req.path.match(/platforms/) && req.get?
      id=req.path.split('/')[2]
      platform=Platform.find_by_id(id)
      if platform
        games=platform.games
        platform_resp = {
          name: platform.name,
          games:games
        }
        return [
          200, 
          { 'Content-Type' => 'application/json' }, 
          [ platform_resp.to_json ]
        ]
      else
        return [
          404, 
          { 'Content-Type' => 'application/json' }, 
          [ {error: "Platform not Found"}.to_json ]
        ]
      end 
    else
      res.write "Path Not Found"

    end

    res.finish
  end

end
