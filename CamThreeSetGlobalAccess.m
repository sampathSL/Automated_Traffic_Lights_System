% File GlobalAccess.m
%define the globhal variable in the workspace and initialize them
%Exception are write into exception.txt
%Created By : Sampath Thennakoon
%Date:13082011
function CamThreeSetGlobalAccess(expFileName)
    try
        global expFileThree;
        global vidObjectThree;
        vidObjectThree = 0;
        expFileThree = expFileName;
        
    catch exp
        
        strDate = datestr(now);
        msgString = getReport(exp);
        strobject = sprintf('%s -- %s\n',strDate,msgString);
        fid = fopen(expFileThree,'a');
        fprintf(fid, '%s\n', strobject);
        fclose(fid);
    
    end
end