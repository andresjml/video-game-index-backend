class Application

  def call(env)
    res = Rack::Response.new
    req = Rack::Request.new(env)

    
    

      # GAME RESTful ROUTES

      # Game Index

      if req.path == '/games' && req.get?
        games=Game.all
        return [
          200, 
          { 'Content-Type' => 'application/json' }, 
          [ games.to_json ]
        ]    
      end

      # Game Create

      if req.path =='/games' && req.post?
        body=JSON.parse(req.body.read)
        game=Game.create(body)
        return [
          201, 
          { 'Content-Type' => 'application/json' }, 
          [ game.to_json ]
        ] 
      end

      # Game Show

      if req.path.match(/games/) && req.get?
        id=req.path.split('/')[2]
        game=Game.find_by_id(id)
        if game
          platforms=game.platforms
          game_resp = {
            id: game.id,
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
      end

      # Game Update

      if req.path.match(/games/) && req.patch?
        id=req.path.split('/')[2]
        game=Game.find_by_id(id)
        body=JSON.parse(req.body.read)
        if game
          game.update(body)
          return [
            202, 
            { 'Content-Type' => 'application/json' }, 
            [ game.to_json ]
          ]
        else
          return [
            404, 
            { 'Content-Type' => 'application/json' }, 
            [ {error: "Somethig went wrong"}.to_json ]
          ]
        end
      end

      # Game Destroy

      if req.path.match(/games/) && req.delete?
        id=req.path.split('/')[2]
        game=Game.find_by_id(id)
        if game
          game.destroy
          return [
            200, 
            { 'Content-Type' => 'application/json' }, 
            [ {message: "Game Deleted"}.to_json ]
          ]
        else
          return [
            404, 
            { 'Content-Type' => 'application/json' }, 
            [ {error: "Game not Found"}.to_json ]
          ]
        end

      end



      # GENRE RESTful ROUTES

      # Genre Index

      if req.path == '/genres' && req.get?
        genres=Genre.all
        return [
          200, 
          { 'Content-Type' => 'application/json' }, 
          [ genres.to_json ]
        ] 
      end  

      # Genre Create

      if req.path =='/genres' && req.post?
        body=JSON.parse(req.body.read)
        genre=Genre.create(body)
        return [
          201, 
          { 'Content-Type' => 'application/json' }, 
          [ genre.to_json ]
        ] 
      end

      # Genre Show

      if req.path.match(/genres/) && req.get?
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
      end

      # Genre Update

      if req.path.match(/genres/) && req.patch?
        id=req.path.split('/')[2]
        genre=Genre.find_by_id(id)
        body=JSON.parse(req.body.read)
        if genre
          genre.update(body)
          return [
            202, 
            { 'Content-Type' => 'application/json' }, 
            [ genre.to_json ]
          ]
        else
          return [
            404, 
            { 'Content-Type' => 'application/json' }, 
            [ {error: "Somethig went wrong"}.to_json ]
          ]
        end
      end

      # Genre Destroy

      if req.path.match(/genres/) && req.delete?
        id=req.path.split('/')[2]
        genre=Genre.find_by_id(id)
        if genre
          genre.destroy
          return [
            200, 
            { 'Content-Type' => 'application/json' }, 
            [ {message: "Genre Deleted"}.to_json ]
          ]
        else
          return [
            404, 
            { 'Content-Type' => 'application/json' }, 
            [ {error: "Genre not Found"}.to_json ]
          ]
        end

      end

       

      #static route to test rack
      if req.path.match(/test/)
        return [200, {'Content-Type'=> 'application/json'}, [{message: "Test Response!"}.to_json]]
      else
        res.write "Path Not Found"
      end
    res.finish
  end

end
