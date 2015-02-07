% File GlobalAccess.m
%define the globhal variable in the workspace and initialize them
%Exception are write into exception.txt
%Created By : Sampath Thennakoon
%Date:13082011
function SetGlobalODItems(expFileName)
    try
        
        global expFileOne;
        expFileOne = expFileName;
        
    catch exp
        
        ExceptionFunction(exp);
    
    end
end