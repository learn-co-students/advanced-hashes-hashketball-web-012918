# Write your code here!
require "pry"

def game_hash
  bball = { #1 <-- this hash
    home: { #2
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: {  #3
        "Alan Anderson" => { #4
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
end


def num_points_scored(player_name)
  players_points = 0
  game_hash.each do |courts, teams| #1
    teams.each do |team_traits, team_info| #2
      if team_traits == :players
        team_info.each do |trait, stats| #3
          if trait == player_name
            stats.each do |stat_key, stat_value| #4
              if stat_key == :points
                players_points = stat_value
              end
            end
          end
        end
      end
    end
  end
players_points
end
# num_points_scored("Alan Anderson")

def shoe_size(player_name)
  players_shoe = 0
  game_hash.each do |courts, teams| #1
    teams.each do |team_traits, team_info| #2
      if team_traits == :players
        team_info.each do |trait, stats| #3
          if trait == player_name
            stats.each do |stat_key, stat_value| #4
              if stat_key == :shoe
                players_shoe = stat_value
              end
            end
          end
        end
      end
    end
  end
  players_shoe
end


def team_colors(team_s)
  team_colors = []
  game_hash.each do |courts, teams| #1
     if  teams.has_value?(team_s) == true
       teams.each do |team_traits, team_info| #2
         if team_traits == :colors
           team_colors = team_info
         end
       end
    end
  end
  team_colors # => ["Black", "White"]
end
# team_colors("Brooklyn Nets")


def team_names
  t_names = []
  game_hash.each do |courts, teams|
    teams.each do |team_traits, team_info|
      if team_traits == :team_name
        t_names << team_info
      end
    end
  end
  t_names
end

def player_numbers(team_s)
  team_numbers = []
  game_hash.each do |courts, teams| #1
    if  teams.has_value?(team_s) == true
      teams.each do |team_traits, team_info| #2
        if team_traits == :players
          team_info.each do |trait, stats| #3
              stats.each do |stat_key, stat_value| #4
                if stat_key == :number
                  team_numbers << stat_value
                end
              end
            end
          end
        end
      end
    end
  team_numbers
end

def player_stats(player_name)
p_stats = {}
  game_hash.each do |courts, teams| #1
    teams.each do |team_traits, team_info| #2
      if team_traits == :players
        team_info.each do |trait, stats| #3
          if trait == player_name
            p_stats = stats
          end
        end
      end
    end
  end
  p_stats
end

def big_shoe_rebounds
  big_shoe = 0
  big_rebound = 0
  big_shoe_name = ""
    game_hash.each do |courts, teams| #1
      teams.each do |team_traits, team_info| #2
        if team_traits == :players
          team_info.each do |trait, stats| #3
              stats.each do |stat_key, stat_value| #4
                if stat_key == :shoe
                  if big_shoe < stat_value
                    big_shoe = stat_value
                    big_shoe_name = trait

                    # find the biggest shoe value => 19
                    # assigns player's name
                  end
                end
              end
          end
          team_info.each do |trait, stats|
            if trait == big_shoe_name
              stats.each do |stat_key, stat_value|
                if stat_key == :rebounds
                  big_rebound = stat_value
                end
              end
            end
          end
        end
      end
    end
    big_rebound
end
# big_shoe_rebounds
