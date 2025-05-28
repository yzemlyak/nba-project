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
end
