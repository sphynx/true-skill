# function shows the rating change for the first player
# the change for the seconds player is the opposite of this,
# ie. our rating system is zero-sum

# input:
# rating1, rating2 - ratings
# result - 0, 0.5, 1 from the first-player perspective
# K - K-value for both players, linearly affects rating change

# output:
# updated_rating1, updated_rating2 - both updated ratings
# change - the value of rating change for the 1st player
function [updated_rating1, updated_rating2, change] = gaussian_elo(rating1, rating2, result, K)
  diff = rating1 - rating2;

  # assumed performance std 
  beta = 200;
  
  # here we are using that the difference between two
  # normally distributed variables is a normally distributed
  # value as well.

  # e.g. r1 ~ N(mu1, sigma1 ^ 2)
  #      r2 ~ N(mu2, sigma2 ^ 2)

  # then (r1 -r2) ~ N(mu12, sigma12 ^ 2)
  # where mu12 = mu1 - mu2,
  #       sigma12 ^ 2 = sigma1 ^ 2 + sigma2 ^ 2
  # for details please see:
  # http://mathworld.wolfram.com/NormalDifferenceDistribution.html

  # so, to get the probability that second player will win we use
  # cumulative d.f. value for 0 (0 is exact draw) as a total number
  # of outcomes with difference < 0
  # p_second_win = normcdf(0, diff, beta * sqrt(2));

  # this can be rewritten in terms of standard normcdf by shifting its
  # graphic to the left by `diff` and squeezing by `beta * sqrt(2)`
  # p_second_win = normcdf(-diff / (beta * sqrt(2)));

  # or rewriting for the first player to get rid of "minus":
  p_first_win = normcdf(diff / (beta * sqrt(2)));
  #p_first_win = logistic_cdf(diff / (beta * sqrt(2)));

  change = K * (result - p_first_win);
  updated_rating1 = rating1 + change;
  updated_rating2 = rating2 - change;

end
