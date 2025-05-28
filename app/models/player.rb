# == Schema Information
#
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
class Player < ApplicationRecord
  belongs_to :team, required: true, class_name: "Team", foreign_key: "team_id"
end
#will need to put some data from csv into team.rb and some into player.rb
#will need a query to find the player's team every time they are accessed
#Yoni will need to add step 5 equivalent from CSV lesson 
