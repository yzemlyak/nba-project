namespace :slurp do
  desc "TODO"
  task player_stats: :environment do
    require "csv"
    csv_text = File.read(Rails.root.join("lib", "csvs", "player_stats.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
    csv.each do |row|
      puts row.to_hash
    end
  end
end
