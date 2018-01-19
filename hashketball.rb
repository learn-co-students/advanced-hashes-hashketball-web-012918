require 'pry'

def game_hash
  game_hash = {
        home: {
            team_name: "Brooklyn Nets",
            colors: ["Black", "White"],
            players: {
                "Alan Anderson" => {
                    number: 0,
                    shoe: 16,
                    points: 22,
                    rebounds: 12,
                    assists: 12,
                    steals: 3,
                    blocks: 1,
                    slam_dunks: 1
                },
                "Reggie Evans" => {
                    number: 30,
                    shoe: 14,
                    points: 12,
                    rebounds: 12,
                    assists: 12,
                    steals: 12,
                    blocks: 12,
                    slam_dunks: 7
                },
                "Brook Lopez" => {
                    number: 11,
                    shoe: 17,
                    points: 17,
                    rebounds: 19,
                    assists: 10,
                    steals: 3,
                    blocks: 1,
                    slam_dunks: 15
                },
                "Mason Plumlee" => {
                    number: 1,
                    shoe: 19,
                    points: 26,
                    rebounds: 12,
                    assists: 6,
                    steals: 3,
                    blocks: 8,
                    slam_dunks: 5
                },
                "Jason Terry" => {
                    number: 31,
                    shoe: 15,
                    points: 19,
                    rebounds: 2,
                    assists: 2,
                    steals: 4,
                    blocks: 11,
                    slam_dunks: 1
                }
            }
        },

        away: {
            team_name: "Charlotte Hornets",
            colors: ["Turquoise", "Purple"],
            players: {
                "Jeff Adrien" => {
                    number: 4,
                    shoe: 18,
                    points: 10,
                    rebounds: 1,
                    assists: 1,
                    steals: 2,
                    blocks: 7,
                    slam_dunks: 2
                },
                "Bismak Biyombo" => {
                    number: 0,
                    shoe: 16,
                    points: 12,
                    rebounds: 4,
                    assists: 7,
                    steals: 7,
                    blocks: 15,
                    slam_dunks: 10
                },
                "DeSagna Diop" => {
                    number: 2,
                    shoe: 14,
                    points: 24,
                    rebounds: 12,
                    assists: 12,
                    steals: 4,
                    blocks: 5,
                    slam_dunks: 5
                },
                "Ben Gordon" => {
                    number: 8,
                    shoe: 15,
                    points: 33,
                    rebounds: 3,
                    assists: 2,
                    steals: 1,
                    blocks: 1,
                    slam_dunks: 0
                },
                "Brendan Haywood" => {
                    number: 33,
                    shoe: 15,
                    points: 6,
                    rebounds: 12,
                    assists: 12,
                    steals: 22,
                    blocks: 5,
                    slam_dunks: 12
                }
            }
        }
    }
    game_hash
end
# game_hash

def good_practices
  game_hash.each do |location, team_data|
    #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
    binding.pry
      team_data.each do |attribute, data|
        #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
        binding.pry

        #what is 'data' at each loop through out .each block? when will the following line of code work and when will it break?
        if !data.is_a?(String)
          data.each do |data_item|
            binding.pry
          end
        end
      end
  end
end
# good_practices

def num_points_scored(player)
  points = 0

  game_hash.each do |location, team_data|
    # binding.pry
    team_data.each do |attribute, data|
      # binding.pry
      if data.is_a?(Hash)
        data.each do |data_item, stats|
          # binding.pry
          if data_item == player
            stats.each do |statistic, value|
              # binding.pry
              if statistic == :points
                points = value
              end
            end
          end
        end
      end
    end
  end

  points
end

def shoe_size(player)
  shoe = 0

  game_hash.each do |location, team_data|
    # binding.pry
    team_data.each do |attribute, data|
      # binding.pry
      if data.is_a?(Hash) # if attribute == :players (?)
        data.each do |data_item, stats|
          # binding.pry
          if data_item == player
            stats.each do |statistic, value|
              # binding.pry
              if statistic == :shoe
                shoe = value
              end
            end
          end
        end
      end
    end
  end

  shoe
end

def team_colors(team_name)
  colors = nil

  game_hash.each do |location, team_data|
    # binding.pry
    team_data.each do |attribute, data|
      # binding.pry
      if data == team_name
        # binding.pry
        colors = team_data[:colors]
      end
    end
  end

  colors
end

def team_names
  names = []

  game_hash.each do |location, team_data|
    # binding.pry
    team_data.each do |attribute, data|
      # binding.pry
      if data.is_a?(String)
        names << data
        # binding.pry
      end
    end
  end

  names
end

def player_numbers(team_name)
  jersey_numbers = []

  game_hash.each do |location, team_data|
    # binding.pry
    if team_data[:team_name] == team_name
      team_data.each do |attribute, data|
        # binding.pry
        if data.is_a?(Hash)
          data.each do |data_item, stats|
            # binding.pry
            stats.each do |statistic, value|
              # binding.pry
              if statistic == :number
                # binding.pry
                jersey_numbers << value
              end
            end
          end
        end
      end
    end
  end

  jersey_numbers
end

def player_stats(player)
  statistics = nil

  game_hash.each do |location, team_data|
    # binding.pry
    team_data.each do |attribute, data|
      # binding.pry
      if data.is_a?(Hash)
        data.each do |data_item, stats|
          # binding.pry
          if data_item == player
            # binding.pry
            statistics = stats
          end
        end
      end
    end
  end

  statistics
end

def big_shoe_rebounds
  players = {}

  game_hash.each do |location, team_data|
    # binding.pry
    team_data.each do |attribute, data|
      # binding.pry
      if attribute == :players
        # binding.pry
        data.each do |data_item, stats|
          players[data_item] = shoe_size(data_item)
          # binding.pry
          # shoe_size(data_item)
        end
      end
    end
  end

  players = players.sort { |first, second| first[1] <=> second[1] }
  rebounds = player_stats(players[-1][0])[:rebounds]
  # binding.pry
end

def most_points_scored
  players = {}

  game_hash.each do |location, team_data|
    # binding.pry
    team_data.each do |attribute, data|
      # binding.pry
      if attribute == :players
        # binding.pry
        data.each do |data_item, stats|
          players[data_item] = num_points_scored(data_item)
          # binding.pry
        end
      end
    end
  end

  players = players.sort { |first, second| first[1] <=> second[1] }
  players[-1][0]
  # binding.pry
end

def winning_team
  nets = {}
  hornets = {}

  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      # binding.pry
      if attribute == :players
        # binding.pry
        data.each do |data_item, stats|
          if team_data[:team_name] == "Brooklyn Nets"
            nets[data_item] = num_points_scored(data_item)
          else
            hornets[data_item] = num_points_scored(data_item)
          end
        end
      end
    end
  end

  nets_total = nets.collect {|name, points| points}.reduce(:+)
  hornets_total = hornets.collect {|name, points| points}.reduce(:+)
  nets_total > hornets_total ? "Brooklyn Nets" : "Charlotte Hornets"
end

def player_with_longest_name
  names = []

  game_hash.each do |location, team_data|
    # binding.pry
    team_data.each do |attribute, data|
      # binding.pry
      if attribute == :players
        # binding.pry
        data.each do |player_name, stats|
          names << player_name
          # binding.pry
        end
      end
    end
  end

  names.sort_by {|name| name.length}.pop
end

def long_name_steals_a_ton?
  steals = {}

  game_hash.each do |location, team_data|
    # binding.pry
    team_data.each do |attribute, data|
      # binding.pry
      if attribute == :players
        data.each do |player_name, stats|
          # binding.pry
          stats.each do |statistic, value|
            # binding.pry
            if statistic == :steals
              steals[player_name] = value
            end
          end
        end
      end
    end
  end

  steals = steals.sort { |first, second| first[1] <=> second[1] }
  steals[-1][0] == player_with_longest_name ? true : false
end
