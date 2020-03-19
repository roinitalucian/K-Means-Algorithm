% afiseaza o reprezentare grafica a rezultatului clusteringului
function view_clusters(points, centroids)
  NP = length(points(:,1));
  NC = length(centroids(:,1));
  colors = [];

  % foloseste vectorul cu indicii grupurilor drept culori
  for i = 1:NP
    d = distance(repmat(points(i,:), NC , 1), centroids);
    [d, index] = min(d);
    colors = [ colors; index ];      
  end
  
  scatter3(points(:, 1), points(:, 2), points(:, 3), [], colors, "filled");
end
