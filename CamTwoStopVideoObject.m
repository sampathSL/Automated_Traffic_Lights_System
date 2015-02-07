function CamTwoStopVideoObject()

    try
    
        global vidObjectTwo;
        global expFileTwo;
        stop(vidObjectTwo);
    
    catch exp
        
        strDate = datestr(now);
        msgString = getReport(exp);
        strobject = sprintf('%s -- %s\n',strDate,msgString);
        fid = fopen(expFileTwo,'a');
        fprintf(fid, '%s\n', strobject);
        fclose(fid);
        
    end
    
end