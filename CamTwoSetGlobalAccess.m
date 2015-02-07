% File GlobalAccess.m
%define the globhal variable in the workspace and initialize them
%Exception are write into exception.txt
%Created By : Sampath Thennakoon
%Date:13082011
function CamTwoSetGlobalAccess(expFileName)
    try
        global expFileTwo;
        global vidObjectTwo;
        vidObjectTwo = 0;
        expFileTwo = expFileName;
        
    catch exp
        
        strDate = datestr(now);
        msgString = getReport(exp);
        strobject = sprintf('%s -- %s\n',strDate,msgString);
        fid = fopen(expFileTwo,'a');
        fprintf(fid, '%s\n', strobject);
        fclose(fid);
    
    end
end