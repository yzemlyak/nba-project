Rails.application.routes.draw do
  # Routes for the Player resource:
  root "players#index"
  # CREATE
  post("/insert_player", { :controller => "players", :action => "create" })
          
  # READ
  get("/players", { :controller => "players", :action => "index" })
  
  get("/players/:path_id", { :controller => "players", :action => "show" })
  
  # UPDATE
  
  post("/modify_player/:path_id", { :controller => "players", :action => "update" })
  
  # DELETE
  get("/delete_player/:path_id", { :controller => "players", :action => "destroy" })

  #------------------------------

  # Routes for the Team resource:

  # CREATE
  post("/insert_team", { :controller => "teams", :action => "create" })
          
  # READ
  get("/teams", { :controller => "teams", :action => "index" })
  
  get("/teams/:path_id", { :controller => "teams", :action => "show" })
  
  # UPDATE
  
  post("/modify_team/:path_id", { :controller => "teams", :action => "update" })
  
  # DELETE
  get("/delete_team/:path_id", { :controller => "teams", :action => "destroy" })

  #------------------------------

  devise_for :users

  # This is a blank app! Pick your first screen, build out the RCAV, and go from there. E.g.:

  # get "/your_first_screen" => "pages#first"
  
end
