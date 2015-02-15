function [] = recognize(fileName, f, p)
    [ges, loc] = recognizeGesture(fileName, f, p);
%     disp(fileName);
%     disp(ges);
%     disp(loc);
%     disp('  ');
    fprintf('%s %s %s\n', fileName, ges, loc);
end