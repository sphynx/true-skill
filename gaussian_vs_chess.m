# a function used to analyse the differences between two implementations of Elo:
# chess and Gaussian
function diff_change = gaussian_vs_chess(rating1, rating2, result, K)
  [_, _, gc] = gaussian_elo(rating1, rating2, result, K);
  [_, _, c] = chess_elo(rating1, rating2, result, K);
  diff_change = gc - c;
end
                    
