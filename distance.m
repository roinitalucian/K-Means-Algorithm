% calculeaza distanta euclidiana dintre punctele a si b
function d = distance(a, b)
  d = ((sum(((a - b).^2)')).^(1/2))';
end
