require 'open-uri'

class PagesController < ApplicationController

  def getMovieMon
    return random = JSON.parse(open("https://random-movie.herokuapp.com/random").read)
  end

  def index
    random = Random.new
    $view = "menu"
    $user =
    {
      'vie' => 100,
      'force' => 0,
      'ownedMovieMon' => [],
      'pos' => [random.rand(10),random.rand(10)],
      'indexMM' => 0,
    }
    $game =
    {
      'moviemon' => [],
    }
    15.times { $game['moviemon'] << getMovieMon }
    total = 0
    $game['moviemon'].each_index { |x| total = total + $game['moviemon'][x]['imdbRating'].to_f }
    total = total / $game['moviemon'].size
    $user['power'] = total
  end







  def game
    $view = "game"
    $game['map'] = Map.new($user['pos'][0], $user['pos'][1]).html
  end
  def moviedex
    $view = "moviedex"
  end
  def save
    $view = "save"
  end
  def fight
    if ($view != "fightok" && $view != "fightrun" && $view != "fightwon" && $view != "fightlost")
      $view = "fight"
    end
  end






  def off
    redirect_to pages_index_path
  end

  def up
    if $view == "game"
      random = Random.new
      if $user['pos'][1] > 0
        $user['pos'][1] = $user['pos'][1] - 1
        $game['map'] = Map.new($user['pos'][0], $user['pos'][1]).html
      end
      if random.rand(6) == 1
        redirect_to fight_path
      else
        redirect_to game_path
      end
    else
      redirect_to :back
    end
  end

  def down
    if $view == "game"
      random = Random.new
      if $user['pos'][1] < 9
        $user['pos'][1] = $user['pos'][1] + 1
        $game['map'] = Map.new($user['pos'][0], $user['pos'][1]).html
      end
      if random.rand(6) == 1
        redirect_to fight_path
      else
        redirect_to game_path
      end
    else
      redirect_to :back
    end
  end





  def right
    random = Random.new
    if $view == "game"
      if $user['pos'][0] < 9
        $user['pos'][0] = $user['pos'][0] + 1
        $game['map'] = Map.new($user['pos'][0], $user['pos'][1]).html
      end
      if random.rand(6) == 1
        redirect_to fight_path
      else
        redirect_to game_path
      end
    elsif $view == "moviedex"
      if $user['indexMM'] + 1 < $user['ownedMovieMon'].size
        $user['indexMM'] = $user['indexMM'] + 1
      end
      render :moviedex

    else
      redirect_to :back
    end
  end


  def left
    if $view == "game"
      random = Random.new
      if $user['pos'][0] > 0
        $user['pos'][0] = $user['pos'][0] - 1
        $game['map'] = Map.new($user['pos'][0], $user['pos'][1]).html
      end
      if random.rand(6) == 1
        redirect_to fight_path
      else
        redirect_to game_path
      end
    elsif $view == "moviedex"
      if $user['indexMM'] - 1 >= 0
        $user['indexMM'] = $user['indexMM'] - 1
      end
      render :moviedex
    else
      redirect_to :back
    end
  end


  def buttona
    if $view == "menu"
      redirect_to game_path
    elsif $view == "fight"
      $view = "fightok"
      render :fight
    elsif $view == "fightok"
      random = Random.new
      $user['vie'] = $user['vie'] - (($game['moviemon'][-1]['imdbRating'].to_f / random.rand(1..5)) * 4)
      $user['vie'] = (100 * $user['vie'].floor) / 100
      $user['enemy'] = $user['enemy'] - (($user['power'].to_f / random.rand(1..5)) * 4	)
      if $user['enemy'] < 0
        $view = "fightwon"
        $user['ownedMovieMon'] << $game['moviemon'][-1]
         $user['power'] = ($user['power'] + $game['moviemon'][-1]['imdbRating'].to_f) / 2
        $game['moviemon'].pop
        $user['vie'] = 100

      elsif $user['vie'] < 0
        $view = "fightlost"
        $game['moviemon'].pop
        $user['vie'] = 100
      end
      redirect_to fight_path
    elsif $view == "save"
      # SAUVEGARDER
      redirect_to game_path
    elsif $view == "fightrun" || $view == "fightwon" || $view == "fightlost"
      $game['moviemon'].pop
      if $game['moviemon'].size == 0
        redirect_to pages_index_path
      else
        redirect_to game_path
      end
    else
      redirect_to :back
    end
  end
  def buttonb
    if $view == "fight"
      $view = "fightrun"
      render :fight
    elsif $view == "fightrun"
      redirect_to game_path
    else
      redirect_to :back
    end
  end

  def buttonstart
    if $view == "menu"
      redirect_to game_path
    elsif $view == "game"
      redirect_to moviedex_path
    elsif $view == "moviedex"
      redirect_to game_path
    elsif $view == "fight"
      $view = "fightrun"
      redirect_to fight_path
    elsif $view == "save"
      redirect_to game_path
    else
      redirect_to :back
    end
  end
  def buttonselect
    if $view == "menu"
      redirect_to game_path
    elsif $view == "game"
      redirect_to save_path
    else
      redirect_to :back
    end
  end

  class Map
    attr_reader :html
    def initialize(x = 0, y = 0)
      ym = 0
      @html = "<table id=\"grid\">\n"
      10.times do
        xm = 0
        @html += "<tr>"
        10.times do
          @html += "<td>"
          if ym == y && xm ==x
            @html += "<img src=\"../assets/megaman8bit.png\" id=\"megaman\" />"
          end
          @html += "</td>"
          xm += 1
        end
        @html += "</tr>\n"
        ym +=1
      end
      @html += "</table>"
    end
  end
end
