namespace :slurp do
  desc "TODO"
  task player_stats: :environment do
    require "csv"
    csv_text = File.read(Rails.root.join("lib", "csvs", "player_stats.csv"))
    puts csv_text
  end

end
