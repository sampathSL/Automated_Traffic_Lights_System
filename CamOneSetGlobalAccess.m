% File GlobalAccess.m
%define the globhal variable in the workspace and initialize them
%Exception are write into exception.txt
%Created By : Sampath Thennakoon
%Date:13082011
function CamOneSetGlobalAccess(expFileName)
    try
        global expFileOne;
        global vidObjectOne;
        vidObjectOne = 0;
        expFileOne = expFileName;
        
    catch exp
        
        strDate = datestr(now);
        msgString = getReport(exp);
        strobject = sprintf('%s -- %s\n',strDate,msgString);
        fid = fopen(expFileOne,'a');
        fprintf(fid, '%s\n', strobject);
        fclose(fid);
    
    end
end