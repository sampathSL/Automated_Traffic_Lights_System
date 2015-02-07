function CamTwoResetDataText(strTextFile)
    try
        global expFileTwo;
        fid=fopen(strTextFile,'wt');
        fclose(fid);
    
    catch exp
    
        strDate = datestr(now);
        msgString = getReport(exp);
        strobject = sprintf('%s -- %s\n',strDate,msgString);
        fid = fopen(expFileTwo,'a');
        fprintf(fid, '%s\n', strobject);
        fclose(fid);
        
    end
    
end