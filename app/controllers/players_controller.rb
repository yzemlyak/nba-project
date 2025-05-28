class PlayersController < ApplicationController
  def index
    matching_players = Player.all

    @list_of_players = matching_players.order({ :created_at => :desc })

    render({ :template => "players/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_players = Player.where({ :id => the_id })

    @the_player = matching_players.at(0)

    render({ :template => "players/show" })
  end

  def create
    the_player = Player.new
    the_player.team_id = params.fetch("query_team_id")
    the_player.name = params.fetch("query_name")
    the_player.points_per_game = params.fetch("query_points_per_game")
    the_player.rebounds_per_game = params.fetch("query_rebounds_per_game")
    the_player.assists_per_game = params.fetch("query_assists_per_game")

    if the_player.valid?
      the_player.save
      redirect_to("/players", { :notice => "Player created successfully." })
    else
      redirect_to("/players", { :alert => the_player.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_player = Player.where({ :id => the_id }).at(0)

    the_player.team_id = params.fetch("query_team_id")
    the_player.name = params.fetch("query_name")
    the_player.points_per_game = params.fetch("query_points_per_game")
    the_player.rebounds_per_game = params.fetch("query_rebounds_per_game")
    the_player.assists_per_game = params.fetch("query_assists_per_game")

    if the_player.valid?
      the_player.save
      redirect_to("/players/#{the_player.id}", { :notice => "Player updated successfully."} )
    else
      redirect_to("/players/#{the_player.id}", { :alert => the_player.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_player = Player.where({ :id => the_id }).at(0)

    the_player.destroy

    redirect_to("/players", { :notice => "Player deleted successfully."} )
  end
end
