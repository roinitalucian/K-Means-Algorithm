% calculeaza coordonatele centroizilor grupurilor la care apartin punctele
function centroids = clustering_pc(points, NC)
	centroids = [];

  NP = length(points(:,1));

  minPoint = min(points);
  maxPoint = max(points);
 
  centroids = rand(NC, 3);

  delta = 1.0;
  % se repeta pana cand pozitiile centroizilor nu se mai modifica
  while delta  > 0.0
    centroids1 = zeros(NC, 3);
    pointsN = zeros(NC, 1);
    indexes = [];

    % iterarea prin matricea de puncte
    for i = 1:NP
      % distanta de la punct la fiecare centroid
      d = distance(repmat(points(i,:), NC , 1), centroids);

      % minimul distantelor si indexul centroidului
      [d, index] = min(d);

      % vectorul in care se tin indecsii cluster-urilor la care
      % apartin punctele
      indexes = [ indexes; index ];

      centroids1(indexes(i), :) += points(i, :);
    end

    for i = 1:NC
      pointsN(i, 1) = sum(indexes == i);
      if (pointsN(i, 1) != 0)
          % recalcularea coordonatelor centroizilor
          centroids1(i, :) = centroids1(i, :) / pointsN(i, 1);
      else
          % regenerarea unor valori aleatoare, in cazul in care clusterul
          % a fost ales gresit
          centroids1(i, :) = (rand(1, 3) .* (maxPoint - minPoint)) + minPoint;
      end
    end
    % recalcularea diferentei pozitiilor
    delta = norm(centroids1 - centroids);
    centroids = centroids1;
  end
end