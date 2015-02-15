function [] = recognize(fileName)
    [ges, loc] = recognizeGesture(fileName);
    fprintf('%s %s %s\n', fileName, ges, loc);
end