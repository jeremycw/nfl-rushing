class Rush < ApplicationRecord
  NAME_ATTR_PAIRS = [
    ['Player', :name],
    ['Team', :team],
    ['Pos', :position],
    ['Att', :attempts],
    ['Att/G', :attempts_per_game],
    ['Yds', :yards],
    ['Avg', :avg_yards],
    ['Yds/G', :yards_per_game],
    ['TD', :touchdowns],
    ['Lng', :longest_rush],
    ['1st', :first_downs],
    ['1st%', :first_down_percent],
    ['20+', :over_20_yards],
    ['40+', :over_40_yards],
    ['FUM', :fumbles]
  ]
end
