# Write your code here!
require "pry"
# require "byebug"

def game_hash
  {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        "Reggie Evans" => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        "Brook Lopez" => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        "Mason Plumlee" => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        "Jason Terry" => {
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        }
      }
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        "Bismak Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10
        },
        "DeSagna Diop" => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        "Ben Gordon" => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        "Brendan Haywood" => {
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 22,
          :blocks => 5,
          :slam_dunks => 12
        }
      }
    },
  }
end


def num_points_scored(player)
  game_hash.each do |team_location, team_stats|
    team_stats.each do |location_team_stats, specific_stats|
      if location_team_stats == :players
        specific_stats.each do |team_player, player_stats|
          if team_player == player
            return player_stats[:points]
          end
        end
      end
    end
  end
end

def shoe_size(player)
  game_hash.each do |team_location, team_stats|
    team_stats.each do |location_team_stats, specific_stats|
      if location_team_stats == :players
        specific_stats.each do |team_player, player_stats|
          if team_player == player
            return player_stats[:shoe]
          end
        end
      end
    end
  end
end

def team_colors(team)
  game_hash.each do |team_location, team_stats|
      team_stats.each do |location_team_stats, specific_stats|
        if specific_stats == team
          return team_stats[:colors]
        end
      end
  end
end

def team_names
  both_teams = []
  game_hash.each do |team_location, team_stats|
    team_stats.each do |location_team_stats, specific_stats|
      if location_team_stats == :team_name
        both_teams << specific_stats
      end
    end
  end
  both_teams
end

def player_numbers(team)
  player_number_arr = []
  game_hash.each do |team_location, team_stats|
      team_stats.each do |location_team_stats, specific_stats|
        if specific_stats == team
          team_stats[:players].each do |team_player, player_stats|
            player_stats.each do |player_attribute, attribute_stats|
              if player_attribute == :number
                player_number_arr << attribute_stats
              end
            end
          end
        end
      end
  end
  player_number_arr
end

def player_stats(player)
  answer = nil
  game_hash.each do |team_location, team_stats|

    team_stats.each do |location_team_stats, specific_stats|

      if location_team_stats == :players
        specific_stats.collect do |team_player, player_stats|
          if team_player == player
            answer = player_stats
          end
        end
      end
    end
  end
  answer
end

def big_shoe_rebounds
  biggest_shoe_size = 0
  biggest_rebounds = 0
  game_hash.each do |team_location, team_stats|
    team_stats[:players].each do |player, stats|
      if biggest_shoe_size < stats[:shoe]
        biggest_shoe_size = stats[:shoe]
        biggest_rebounds = stats[:rebounds]
      end
    end
  end
  biggest_rebounds
end

def most_points_scored
  most_points = 0
  most_points_player = nil
  game_hash.each do |team_location, team_stats|
    team_stats[:players].each do |player, stats|
      if !most_points_player || most_points < stats[:points]
        most_points = stats[:points]
        most_points_player = player
      end
    end
  end
  most_points_player
end


def winning_team
  winner = nil
  winner_points = 0
  game_hash.each do |home_away, team|
    total_points = team_points(team)
    if total_points > winner_points
      winner_points = total_points
      winner = team[:team_name]
    end
  end
  winner
end

def team_points(team)
  points = 0
  team[:players].each do |player, stat|
    points += stat[:points]
  end
  points
end

def player_with_longest_name
  longest_name = ""
  game_hash.each do |home_away, team_stats|
    team_stats[:players].each do |player_name, player_stats|
      if player_name.length > longest_name.length
        longest_name = player_name
      end
    end
  end
  longest_name

end

def long_name_steals_a_ton?
  player_steals(player_with_longest_name)
  byebug
end

# def player_steals(player)
#   game_hash.each do |team_location, team_stats|
#     team_stats.each do |location_team_stats, specific_stats|
#       if location_team_stats == :players
#         specific_stats.each do |team_player, player_stats|
#           if team_player == player
#             return player_stats[:steals]
#           end
#         end
#       end
#     end
#   end
# end
