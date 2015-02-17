% iterating through a cell array
function [] = iter(cellArray)
    for i = 1:size(cellArray, 2)
        disp(cellArray{i});
    end
end