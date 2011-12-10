function gaussian_vs_chess_surface
  r1s = 1200:50:2200;
  r2s = 1200:50:2200;
  z = zeros(length(r1s), length(r2s));
  K = 24;
  result = 1;
  for i = 1:length(r1s)
    for j = 1:length(r2s)
      z(i,j) = abs(gaussian_vs_chess(r1s(j), r2s(i), result, K));
    end
  end
  surf(r1s, r2s, z);
end
