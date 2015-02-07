function CamOneStopVideoObject()

    try
    
        global vidObjectOne;
        global expFileOne;
        stop(vidObjectOne);
    
    catch exp
        
        strDate = datestr(now);
        msgString = getReport(exp);
        strobject = sprintf('%s -- %s\n',strDate,msgString);
        fid = fopen(expFileOne,'a');
        fprintf(fid, '%s\n', strobject);
        fclose(fid);
        
    end
    
end