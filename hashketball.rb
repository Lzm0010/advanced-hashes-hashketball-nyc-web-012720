def game_hash
  {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => [{
        :player_name => "Alan Anderson",
        :number => 0,
        :shoe => 16,
        :points => 22,
        :rebounds => 12,
        :assists => 12,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 1 
      },{
        :player_name => "Reggie Evans",
        :number => 30,
        :shoe => 14,
        :points => 12,
        :rebounds => 12,
        :assists => 12,
        :steals => 12,
        :blocks => 12,
        :slam_dunks => 7
      },{
        :player_name => "Brook Lopez",
        :number => 11,
        :shoe => 17,
        :points => 17,
        :rebounds => 19,
        :assists => 10,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 15
      },{
        :player_name => "Mason Plumlee",
        :number => 1,
        :shoe => 19,
        :points => 26,
        :rebounds => 11,
        :assists => 6,
        :steals => 3,
        :blocks => 8,
        :slam_dunks => 5
      },{
        :player_name => "Jason Terry",
        :number => 31,
        :shoe => 15,
        :points => 19,
        :rebounds => 2,
        :assists => 2,
        :steals => 4,
        :blocks => 11,
        :slam_dunks => 1
      }]
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => [{
        :player_name => "Jeff Adrien",
        :number => 4,
        :shoe => 18,
        :points => 10,
        :rebounds => 1,
        :assists => 1,
        :steals => 2,
        :blocks => 7,
        :slam_dunks => 2
      },{
        :player_name => "Bismack Biyombo",
        :number => 0,
        :shoe => 16,
        :points => 12,
        :rebounds => 4,
        :assists => 7,
        :steals => 22,
        :blocks => 15,
        :slam_dunks => 10
      },{
        :player_name => "DeSagna Diop",
        :number => 2,
        :shoe => 14,
        :points => 24,
        :rebounds => 12,
        :assists => 12,
        :steals => 4,
        :blocks => 5,
        :slam_dunks => 5
      },{
        :player_name => "Ben Gordon",
        :number => 8,
        :shoe => 15,
        :points => 33,
        :rebounds => 3,
        :assists => 2,
        :steals => 1,
        :blocks => 1,
        :slam_dunks => 0
      },{
        :player_name => "Kemba Walker",
        :number => 33,
        :shoe => 15,
        :points => 6,
        :rebounds => 12,
        :assists => 12,
        :steals => 7,
        :blocks => 5,
        :slam_dunks => 12
      }]
    }
  }
end

# def get_player(player_name)
#   teams = [:home, :away]
#   teams.each{|team|
#     game_hash[team][:players].each{ |player|
#       if player[:player_name] == player_name
#         return player
#       end
#     }
#   }
# end

def get_player(key, value)
  teams = [:home, :away]
  teams.each{|team|
    game_hash[team][:players].each{ |player|
      if player[key] == value
        return player
      end
    }
  }
end

def get_team(team_name)
  teams = [:home, :away]
  teams.each{|team|
    if game_hash[team][:team_name] == team_name
        return game_hash[team]
    end
  }
end

def num_points_scored(player_name)
  current_player = get_player(:player_name, player_name)
  current_player[:points]
end

def shoe_size(player_name)
  current_player = get_player(:player_name, player_name)
  current_player[:shoe]
end

def team_colors(team_name)
  current_team = get_team(team_name)
  current_team[:colors]
end

def team_names
  teams = []
  game_hash.each_pair{|key, value|
    teams << value[:team_name]
  }
  teams
end

def player_numbers(team_name)
  numbers = []
  current_team = get_team(team_name)
  current_team[:players].each {|player|
    numbers << player[:number]
  }
  numbers
end

def player_stats(player_name)
  current_player = get_player(:player_name, player_name)
  current_player.delete(:player_name)
  current_player
end

def big_shoe_rebounds
  #find largest shoe size
  largest_shoe = 0
  teams = [:home, :away]
  teams.each{|team|
    game_hash[team][:players].each{ |player|
      if player[:shoe] > largest_shoe
        largest_shoe = player[:shoe]
      end
    }
  }
  
  #return players number of rebounds
  current_player = get_player(:shoe, largest_shoe)
  current_player[:rebounds]
end

def most_points_scored
  most_points = 0
  teams = [:home, :away]
  teams.each{|team|
    game_hash[team][:players].each{ |player|
      if player[:points] > most_points
        most_points = player[:points]
      end
    }
  }
  
  current_player = get_player(:points, most_points)
  current_player[:player_name]
end

def winning_team
  home_score = 0
  away_score = 0
  teams = [:home, :away]
  teams.each{|team|
    game_hash[team][:players].each{ |player|
      if game_hash[team] == game_hash[:home]
        home_score += player[:points]
      else
        away_score += player[:points]
      end
    }
  }
  
  home_score > away_score ? game_hash[:home][:team_name] : game_hash[:away][:team_name]
end

def player_with_longest_name
  longest_name = " "
  teams = [:home, :away]
  teams.each{|team|
    game_hash[team][:players].each{ |player|
      if player[:player_name].length > longest_name.length
        longest_name = player[:player_name]
      end
    }
  }
  longest_name
end

def most_steals
  most_steals = 0
  teams = [:home, :away]
  teams.each{|team|
    game_hash[team][:players].each{ |player|
      if player[:steals] > most_steals
        most_steals = player[:steals]
      end
    }
  }
  
  current_player = get_player(:steals, most_steals)
  current_player[:player_name]
end

def long_name_steals_a_ton?
  most_steals == player_with_longest_name ? true : false
end

