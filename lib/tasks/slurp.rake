namespace :slurp do
  desc "TODO"
  task player_stats: :environment do
    require "csv"
    pp "Destroying Previous Data"
      if Rails.env.development?
        Player.destroy_all
        Team.destroy_all
      end
    pp "Generate Teams"
    csv_text = File.read(Rails.root.join("lib", "csvs", "teams.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
    csv.each do |row|
      t = Team.new
      t.id = row["ID"]
      t.name = row["Name"]
      t.save
    end
    pp "There are now #{Team.count} teams."
    pp "Generating Players"
    csv_text = File.read(Rails.root.join("lib", "csvs", "player_stats.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
    csv.each do |row|
      p = Player.new
      p.id = row["ID"]
      p.name = row["Name"]
      p.points_per_game = row["Points per Game"]
      p.rebounds_per_game = row["Rebounds per Game"]
      p.assists_per_game = row["Assists per Game"]
      p.team_id = row["Team ID"]
      p.save
    end
    pp "There are now #{Player.count} players."
  end
end



# namespace :slurp do
#   desc "TODO"
#   task player_stats: :environment do
#     require "csv"
#     pp "Destroying Previous Data"
#       if Rails.env.development?
#         Player.destroy_all
#         Team.destroy_all
#       end
#     csv_text = File.read(Rails.root.join("lib", "csvs", "player_stats.csv"))
#     csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
#     csv.each do |row|
#       p = Player.new 
#       p.id = row["ID"]
#       p.name = row["Name"]
#       p.points_per_game = row["Points per Game"]
#       p.rebounds_per_game = row["Rebounds per Game"]
#       p.assists_per_game = row["Assists per Game"]
#       p.team_id = row["Team ID"] #haven't added the new CSV with this row yet
#       p.save
#       #puts row.to_hash
#     end
#     #pp "#{p.count} Players created"
#     csv_text = File.read(Rails.root.join("lib", "csvs", "teams.csv"))
#     csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
#     csv.each do |row|
#       t = Team.new 
#       t.id = row["ID"]
#       t.name = row["Name"]
#     end
#   end
# end

# Table name: players
#
#  id                :bigint           not null, primary key
#  assists_per_game  :float
#  name              :string
#  points_per_game   :float
#  rebounds_per_game :float
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  team_id           :integer
#
