function CamThreeResetDataText(strTextFile)
    try
        global expFileThree;
        fid=fopen(strTextFile,'wt');
        fclose(fid);
    
    catch exp
    
        strDate = datestr(now);
        msgString = getReport(exp);
        strobject = sprintf('%s -- %s\n',strDate,msgString);
        fid = fopen(expFileThree,'a');
        fprintf(fid, '%s\n', strobject);
        fclose(fid);
        
    end
    
end