
[1mFrom:[0m /home/aralx73-60035/code/labs/advanced-hashes-hashketball-web-012918/hashketball.rb @ line 131 Object#num_points_scored:

    [1;34m122[0m: [32mdef[0m [1;34mnum_points_scored[0m(player_name)
    [1;34m123[0m: [1;34m# court == :home or :away,[0m
    [1;34m124[0m: [1;34m# data/info == :team_name, :colors, :players[0m
    [1;34m125[0m: [1;34m# traits == values for team_name, colors, players[0m
    [1;34m126[0m: [1;34m# player == player_name[0m
    [1;34m127[0m: [1;34m# stats == num, shoe, etc[0m
    [1;34m128[0m: 
    [1;34m129[0m: players_points = [1;34m0[0m
    [1;34m130[0m:   game_hash.each [32mdo[0m |court, data| [1;34m# 1[0m
 => [1;34m131[0m:     binding.pry
    [1;34m132[0m: 
    [1;34m133[0m: 
    [1;34m134[0m:         [1;34m# data.each do |info, traits| # 2[0m
    [1;34m135[0m: 
    [1;34m136[0m:           [1;34m# traits.each do |player, stats| #3[0m
    [1;34m137[0m:           [1;34m# if data == :players[0m
    [1;34m138[0m:           [1;34m#   if player == player_name && stats == :points[0m
    [1;34m139[0m:           [1;34m#     players_points = stats[0m
    [1;34m140[0m:           [1;34m#   end[0m
    [1;34m141[0m:           [1;34m# end[0m
    [1;34m142[0m:         [1;34m# end #3[0m
    [1;34m143[0m:     [1;34m# end #2[0m
    [1;34m144[0m:   [32mend[0m [1;34m#1[0m
    [1;34m145[0m: 
    [1;34m146[0m: [32mend[0m

