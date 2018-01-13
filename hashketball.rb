require "pry"
# Write your code here!
def game_hash
  game_hash = {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: {
        "Alan Anderson" => {number: 0, shoe: 16, points: 22, rebounds: 12, assists: 12, steals: 3, blocks: 1, slam_dunks: 1},
        "Reggie Evans" => {number: 30, shoe: 14, points: 12, rebounds: 12, assists: 12, steals: 12, blocks: 12, slam_dunks: 7},
        "Brook Lopez" => {number: 11, shoe: 17, points: 17, rebounds: 19, assists: 10, steals: 3, blocks: 1, slam_dunks: 15},
        "Mason Plumlee" => {number: 1, shoe: 19, points: 26, rebounds: 12, assists: 6, steals: 3, blocks: 8, slam_dunks: 5},
        "Jason Terry" => {number: 31, shoe: 15, points: 19, rebounds: 2, assists: 2, steals: 4, blocks: 11, slam_dunks: 1}
      }
    },
    away:{
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: {
        "Jeff Adrien" => {number: 4, shoe: 18, points: 10, rebounds: 1, assists: 1, steals: 2, blocks: 7, slam_dunks: 2},
        "Bismak Biyombo" => {number: 0, shoe: 16, points: 12, rebounds: 4, assists: 7, steals: 7, blocks: 15, slam_dunks: 10},
        "DeSagna Diop" => {number: 2, shoe: 14, points: 24, rebounds: 12, assists: 12, steals: 4, blocks: 5, slam_dunks: 5},
        "Ben Gordon" => {number: 8, shoe: 15, points: 33, rebounds: 3, assists: 2, steals: 1, blocks: 1, slam_dunks: 0},
        "Brendan Haywood" => {number: 33, shoe: 15, points: 6, rebounds: 12, assists: 12, steals: 22, blocks: 5, slam_dunks: 12}
      }
    }
  }
end

def num_points_scored(player)
  points_scored = 0
  game_hash.each do |location, team_data|
    team_data.each do |data, values|
      if values.is_a?(Hash)
        values.each do |mate, stats|
          if mate == player
            stats.each do |type, stat|
              if type == :points
                points_scored = stat
              end
            end
          end
        end
      end
    end
  end
  points_scored
end

def shoe_size(player)
  shoe_size = 0
  game_hash.each do |location, team_data|
    team_data.each do |data, values|
      if values.is_a?(Hash)
        values.each do |mate, stats|
          if mate == player
            stats.each do |type, stat|
              if type == :shoe
                shoe_size = stat
              end
            end
          end
        end
      end
    end
  end
  shoe_size
end

def team_colors(team)
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team
      return team_data[:colors]
    end
  end
end

def team_names
  teams = []
  game_hash.each do |location, team_data|
    teams << game_hash[location][:team_name]
  end
  teams
end

def player_numbers(team)
  team_numbers = []
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team
      team_data.each do |data, values|
        if values.is_a?(Hash)
          values.each do |mate, stats|
              stats.each do |type, stat|
                if type == :number
                  team_numbers << stat
                end
              end
            end
          end
        end
      end
    end
  team_numbers
end

def player_stats(player)
  game_hash.each do |location, team_data|
    team_data.each do |data, values|
      if values.is_a?(Hash)
        values.each do |mate, stats|
          if player == mate
            return stats
          end
        end
      end
    end
  end
end

def big_shoe_rebounds
  largest_size = 0
  player = ""
  rebounds = 0
  game_hash.each do |location, team_data|
    team_data.each do |data, values|
      if values.is_a?(Hash)
        values.each do |mate, stats|
          if stats[:shoe] > largest_size
            rebounds = stats[:rebounds]
          end
        end
      end
    end
  end
  rebounds
end

def most_points_scored
  most_points = 0
  player = ""
  game_hash.each do |location, team_data|
    team_data.each do |data, values|
      if values.is_a?(Hash)
        values.each do |mate, stats|
          if stats[:points] > most_points
            most_points = stats[:points]
            player = mate
          end
        end
      end
    end
  end
  player
end

def winning_team
  points_one = 0
  points_two = 0
  game_hash.each do |location, team_data|
    if points_one == 0
      team_data.each do |data, values|
        if values.is_a?(Hash)
          values.each do |mate, stats|
            points_one += stats[:points]
          end
        end
      end
      else
      team_data.each do |data, values|
        if values.is_a?(Hash)
          values.each do |mate, stats|
            points_two += stats[:points]
          end
        end
      end
    end
  end
  if points_one > points_two
    game_hash[:home][:team_name]
  else
    game_hash[:away][:team_name]
  end
end

def player_with_longest_name
  length = 0
  player = ""
  game_hash.each do |location, team_data|
    team_data.each do |data, values|
      if values.is_a?(Hash)
        values.each do |mate, stats|
          if mate.length > length
            player = mate
          end
        end
      end
    end
  end
  player
end

def long_name_steals_a_ton?
  num_steals = 0
  player_with_most_steals = ""
  game_hash.each do |location, team_data|
    team_data.each do |data, values|
      if values.is_a?(Hash)
        values.each do |mate, stats|
          if stats[:steals] > num_steals
            num_steals = stats[:steals]
            player_with_most_steals = mate
          end
        end
      end
    end
  end

  if player_with_most_steals == player_with_longest_name
    true
  else
    false
  end
end
