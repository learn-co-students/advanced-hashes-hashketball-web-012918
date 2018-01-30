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

game_hash

def num_points_scored(player)
  find_player(player)[:points]
end

def shoe_size(player)
  find_player(player)[:shoe]
end

def team_colors(team)
  return find_team(team)[:colors]
end

def team_names
  team_names = []
  game_hash.each do |location, team_attributes|
    team_names.push(team_attributes[:team_name])
  end
  return team_names
end

def player_numbers(team_name)
  player_numbers = []
  find_team(team_name)[:players].each do |name, stats|
    player_numbers.push(stats[:number])
  end
  player_numbers
end

def player_stats(player_name)
  find_player(player_name)
end

def big_shoe_rebounds
  biggest_shoe = 0
  rebounds = 0
  game_hash.each do |location, team_attributes|
    team_attributes[:players].each do |name, stats|
      if stats[:shoe] > biggest_shoe
        rebounds = stats[:rebounds]
      else
      end
    end
  end
  rebounds
end

def most_points_scored
  most_points = 0
  player_name = ""
  game_hash.each do |location, team_attributes|
    team_attributes[:players].each do |name, stats|
      if stats[:points] > most_points
        most_points = stats[:points]
        player_name = name
      else
      end
    end
  end
  player_name
end

def winning_team
  team_one_score = 0
  team_two_score = 0
  game_hash.each do |location, team_attributes|
    if team_one_score == 0
      team_attributes[:players].each do |player_name, stats|
        team_one_score += stats[:points]
      end
    else
      team_attributes[:players].each do |player_name, stats|
        team_two_score += stats[:points]
      end
    end
  end
  if team_one_score > team_two_score
    game_hash[:home][:team_name]
  elsif team_two_score > team_one_score
    game_hash[:away][:team_name]
  else
  end
end

def player_with_longest_name
  name_length = 0
  player_name = ""
  game_hash.each do |location, team_attributes|
    team_attributes[:players].each do |name, stats|
      if name.length > name_length
        name_length = name.length
        player_name = name
      else
      end
    end
  end
  player_name
end

def long_name_steals_a_ton?
  player_with_long_name = player_with_longest_name
  most_steals = 0
  player_with_most_steals = ""
  game_hash.each do |location, team_attributes|
    team_attributes[:players].each do |name, stats|
      if stats[:steals] > most_steals
        most_steals = stats[:steals]
        player_with_most_steals = name
      else
      end
    end
  end
  if player_with_most_steals == player_with_long_name
    true
  else
    false
  end
end

def find_team(team)
  game_hash.each do |location, team_attributes|
    if team_attributes[:team_name] == team
      return team_attributes
    end
  end
end

def find_player(player)
  game_hash.each do |location, team_attributes|
    team_attributes[:players].each do |player_name, stats|
      if player_name == player
        return stats
      else
      end
    end
  end
end
