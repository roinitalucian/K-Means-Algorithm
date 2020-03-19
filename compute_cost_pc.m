% calculeaza costul total al solutiei clusteringului
function cost = compute_cost_pc(points, centroids)
	cost = 0;
	% compute clustering solution cost

  NP = length(points(:,1));
  NC = length(centroids(:,1));

  for i = 1:NP
    % distanta de la punctul i la fiecare centroid
    d = distance(repmat(points(i,:), NC , 1), centroids);
    % distanta minima
    d = min(d);
    cost += d;
  end
end
