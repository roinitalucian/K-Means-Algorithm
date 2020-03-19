function view_cost_vs_nc(file_points)
  load(file_points);
  costs = [];
  
  for i = 1:10
    centroids = clustering_pc(points, i);
    cost = compute_cost_pc(points, centroids);
    costs = [costs cost];
  end

  plot(1:10, costs);
  ylabel("Cost");
  xlabel("Cluster count");
end

