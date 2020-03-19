% citeste numarul de clustere si coordonatele punctelor din
% fisierele de intrare
function [NC points] = read_input_data(file_params, file_points)  
  NC = load(file_params);
  load(file_points);  
end
