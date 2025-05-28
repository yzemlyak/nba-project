namespace :slurp do
  desc "TODO"
  task player_stats: :environment do
    require "csv"
    csv_text = File.read(Rails.root.join("lib", "csvs", "player_stats.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
    csv.each do |row|
      p = Player.new 
      p.name = row["Name"]
      p.points_per_game = row["Points per Game"]
      p.rebounds_per_game = row["Rebounds per Game"]
      p.assists_per_game = row["Assists per Game"]
      p.team_id = row["Team ID"] #haven't added the new CSV with this row yet
      p.save
      t = Team.new
      t.name = row["Team"]
      t.team_id = row["Team ID"] #haven't added the new CSV with this row yet
      t.save
      #puts row.to_hash
    end
  end
end

#finish activity for p.Player (adding p.save and t.save). Also need to do for Teams (t = Teams.new). 
#After that, t.name = row["Team"] 

#  assists_per_game  :float
#  name              :string
#  points_per_game   :float
#  rebounds_per_game :float
#  team_id           :integer

#teams file
#  name       :string
