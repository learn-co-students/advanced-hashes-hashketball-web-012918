require 'pry'

def game_hash
  {
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
        slam_dunks: 1,
      },
      "Reggie Evans" => {
        number: 30,
        shoe: 14,
        points: 12,
        rebounds: 12,
        assists: 12,
        steals: 12,
        blocks: 12,
        slam_dunks: 7,
      },
      "Brook Lopez" => {
        number: 11,
        shoe: 17,
        points: 17,
        rebounds: 19,
        assists: 10,
        steals: 3,
        blocks: 1,
        slam_dunks: 15,
      },
      "Mason Plumlee" => {
        number: 1,
        shoe: 19,
        points: 26,
        rebounds: 12,
        assists: 6,
        steals: 3,
        blocks: 8,
        slam_dunks: 5,
      },
      "Jason Terry" => {
        number: 31,
        shoe: 15,
        points: 19,
        rebounds: 2,
        assists: 2,
        steals: 4,
        blocks: 11,
        slam_dunks: 1,
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
        slam_dunks: 2,
      },
      "Bismak Biyombo" => {
        number: 0,
        shoe: 16,
        points: 12,
        rebounds: 4,
        assists: 7,
        steals: 7,
        blocks: 15,
        slam_dunks: 10,
      },
      "DeSagna Diop" => {
        number: 2,
        shoe: 14,
        points: 24,
        rebounds: 12,
        assists: 12,
        steals: 4,
        blocks: 5,
        slam_dunks: 5,
      },
      "Ben Gordon" => {
        number: 8,
        shoe: 15,
        points: 33,
        rebounds: 3,
        assists: 2,
        steals: 1,
        blocks: 1,
        slam_dunks: 0,
      },
      "Brendan Haywood" => {
        number: 33,
        shoe: 15,
        points: 6,
        rebounds: 12,
        assists: 12,
        steals: 22,
        blocks: 5,
        slam_dunks: 12,
      }
    }
  }
}
end

def num_points_scored(name)
  points = 0
  game_hash.each do |team, value|
    if value[:players][name] == nil
    else
      points = value[:players][name][:points]
    end
  end
  points
end

def shoe_size(name)
  shoes = ""
  game_hash.each do |team, value|
    if value[:players][name] == nil
    else
      shoes = value[:players][name][:shoe]
    end
  end
  shoes
end

def team_colors(name)
  cols = nil
  game_hash.each do |team, value|
    if value[:team_name] != name
    else
      cols = value[:colors]
    end
  end
  cols
end

def team_names
  ret_arr = []
  ret_arr.push(game_hash[:home][:team_name])
  ret_arr.push(game_hash[:away][:team_name])
  ret_arr
end

def player_numbers(team)
  ret_arr = []
  game_hash.each do |homeaway, value|
    if value[:team_name] == team
      value[:players].each do |name, stats|
        ret_arr.push(stats[:number])
      end
    end
  end
  ret_arr
end

def player_stats(name)
  stats = nil
  game_hash.each do |team, value|
    if value[:players][name] != nil
      stats = value[:players][name]
    end
  end
  stats
end

def big_shoe_rebounds
  big_player = ""
  big_shoes = 0
  boards = 0
  game_hash.each do |team, value|
    value[:players].each do |player, stats|
      if stats[:shoe] > big_shoes
        big_player = player
        big_shoes = stats[:shoe]
      end
    end
  end
  game_hash.each do |team, value|
    if value[:players][big_player] != nil
      boards = value[:players][big_player][:rebounds]
    end
  end
  boards
end
