map = containers.Map();
map('one') = 1;
map('two') = 2;
map('thr') = 3;
ks = keys(map);

for i = 1:size(ks, 2)
    disp(map(char(ks(i)))); % dan teng
end


