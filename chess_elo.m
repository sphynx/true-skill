# The formula is from
# http://en.wikipedia.org/wiki/Elo_rating_system#Theory
# supposedly using logistic curve instead of Gaussian
function [updated_rating1, updated_rating2, change] = chess_elo(rating1, rating2, result, K)
  diff = rating2 - rating1;
  p_first_win = 1 / (1 + 10 ^ (diff / 400));
  change = K * (result - p_first_win);
  updated_rating1 = rating1 + change;
  updated_rating2 = rating2 - change;
end
