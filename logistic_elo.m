# the same as gaussian_elo but with logistic_cdf
# WARNING: not sure if it's possible to use logistic here
function [updated_rating1, updated_rating2, change] = logistic_elo(rating1, rating2, result, K)
  diff = rating1 - rating2;
  beta = 200;
  p_first_win = logistic_cdf(diff / (beta * sqrt(2)));
  change = K * (result - p_first_win);
  updated_rating1 = rating1 + change;
  updated_rating2 = rating2 - change;
end
