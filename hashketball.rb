# Write your code here!
require "pry"

def game_hash
  {
  :home => {
    :team_name => "Brooklyn Nets",
    :colors => ["Black", "White"],
    :players => [
      {
      :name => "Alan Anderson",
      :number => 0,
      :shoe => 16,
      :points => 22,
      :rebounds => 12,
      :assists => 12,
      :steals => 3,
      :blocks => 1,
      :slam_dunks => 1
      },
      {
      :name => "Reggie Evans",
      :number => 30,
      :shoe => 14,
      :points => 12,
      :rebounds => 12,
      :assists => 12,
      :steals => 12,
      :blocks => 12,
      :slam_dunks => 7
      },
      {
      :name => "Brook Lopez",
      :number => 11,
      :shoe => 17,
      :points => 17,
      :rebounds => 19,
      :assists => 10,
      :steals => 3,
      :blocks => 1,
      :slam_dunks => 15
      },
      {
      :name => "Mason Plumlee",
      :number => 1,
      :shoe => 19,
      :points => 26,
      :rebounds => 12,
      :assists => 6,
      :steals => 3,
      :blocks => 8,
      :slam_dunks => 5
      },
      {
      :name => "Jason Terry",
      :number => 31,
      :shoe => 15,
      :points => 19,
      :rebounds => 2,
      :assists => 2,
      :steals => 4,
      :blocks => 11,
      :slam_dunks => 1
      }
    ]
  },
  :away => {
    :team_name => "Charlotte Hornets",
    :colors => ["Turquoise", "Purple"],
    :players => [
      {
      :name => "Jeff Adrien",
      :number => 4,
      :shoe => 18,
      :points => 10,
      :rebounds => 1,
      :assists => 1,
      :steals => 2,
      :blocks => 7,
      :slam_dunks => 2
      },
      {
      :name => "Bismak Biyombo", 
      :number => 0,
      :shoe => 16,
      :points => 12,
      :rebounds => 4,
      :assists => 7,
      :steals => 7,
      :blocks => 15,
      :slam_dunks => 10
      },
      {
      :name => "DeSagna Diop", 
      :number => 2,
      :shoe => 14,
      :points => 24,
      :rebounds => 12,
      :assists => 12,
      :steals => 4,
      :blocks => 5,
      :slam_dunks => 5
      },
      {
      :name => "Ben Gordon",
      :number => 8,
      :shoe => 15,
      :points => 33,
      :rebounds => 3,
      :assists => 2,
      :steals => 1,
      :blocks => 1,
      :slam_dunks => 0
      },
      {
      :name => "Brendan Haywood",
      :number => 33,
      :shoe => 15,
      :points => 6,
      :rebounds => 12,
      :assists => 12,
      :steals => 22,
      :blocks => 5,
      :slam_dunks => 12
      }
    ]
  }
}
end

def num_points_scored(name)
	answer = nil

	game_hash.each do |location, team_data|
		team_data[:players].each do |player_data|
			if player_data[:name] == name
				answer = player_data[:points]
			end
		end
	end
	answer
end

def shoe_size(name)
	shoe = nil

	game_hash.each do |location, data|
		data[:players].each do |player_data|
			if player_data[:name] == name
				shoe = player_data[:shoe]
			end
		end
	end
	shoe
end

def team_colors(team)
	answer = nil
	game_hash.each do |location, team_data|
		if team_data[:team_name] == team
			answer = team_data[:colors]
		end
	end
	answer
end

def team_names
	arr = []
	# arr << game_hash[:home][:team_name]
	# arr << game_hash[:away][:team_name]
	# arr
	game_hash.each do |location, data|
		arr << data[:team_name]
	end
	arr
end

def player_numbers(team)
	arr = []

	game_hash.each do |location, data|
		if data[:team_name] == team
			data[:players].each do |player_data|
				arr << player_data[:number]
			end
		end
	end
	arr
end

def player_stats(name)
	answer = {}

	game_hash.each do |location, team_data|
		team_data[:players].each do |player_data|

					if player_data[:name] == name
						player_data.delete(:name)
						answer = player_data
			end
		end
	end
	answer
end

def big_shoe_rebounds
	largest_shoe = 0
	boards = 0

	game_hash.each do |location, team_data|
		team_data[:players].each do |player_data|
			if player_data[:shoe] > largest_shoe
				largest_shoe = player_data[:shoe]
				boards = player_data[:rebounds]
			end
		end
	end
	boards
end

def most_points_scored
	most_points = 0
	answer = nil

	game_hash.each do |location, team_data|
		team_data[:players].each do |player_data|
			if player_data[:points] > most_points
				most_points = player_data[:points]
				answer = player_data[:name]
			end
		end
	end
	answer
end

def winning_team
	home_points = 0
	away_points = 0

	game_hash.each do |location, team_data|
		if team_data[:location] == team_data[:home]
			team_data[:players].each do |player_data|
				home_points += player_data[:points]
			end
		end
	end
	game_hash.each do |location, team_data|
		if team_data[:location] == team_data[:away]
			team_data[:players].each do |player_data|
				away_points += player_data[:points]
			end
		end
	end

	if home_points > away_points
		return game_hash[:home][:team_name]
	else
		return game_hash[:away][:team_name]
	end
end


def player_with_longest_name
	name = ''

	game_hash.each do |location, team_data|
		team_data[:players].each do |player_data|
			if player_data[:name].length > name.length
				name = player_data[:name]
			end
		end
	end
	name
end

def long_name_steals_a_ton
	most_steals = 0
	answer = nil

	game_hash.each do |location, team_data|
		team_data[:players].each do |player_data|
			if player_data[:steals] > most_steals
				most_steals = player_data[:steals]
				answer = player_data[:name]
			end
		end
	end
	return answer == player_with_longest_name
end

