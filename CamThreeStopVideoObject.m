function CamThreeStopVideoObject()

    try
    
        global vidObjectThree;
        global expFileThree;
        stop(vidObjectThree);
    
    catch exp
        
        strDate = datestr(now);
        msgString = getReport(exp);
        strobject = sprintf('%s -- %s\n',strDate,msgString);
        fid = fopen(expFileThree,'a');
        fprintf(fid, '%s\n', strobject);
        fclose(fid);
        
    end
    
end