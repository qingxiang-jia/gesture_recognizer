function [] = recognize(fileName) % this is a convenient wrapper for recognizeGesture
    [ges, loc] = recognizeGesture(fileName);
    fprintf('%s %s %s\n', fileName, ges, loc);
end