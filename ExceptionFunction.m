function ExceptionFunction(exp)
try
    global expFileOne;
    strDate = datestr(now);
    msgString = getReport(exp);
    strobject = sprintf('%s -- %s\n',strDate,msgString);
    fileOpen = fopen(expFileOne,'a');
    fprintf(fileOpen, '%s\n', strobject);
    fclose(fileOpen);
catch exp
    %ExceptionFunction(exp); -- recursive action here
end
end