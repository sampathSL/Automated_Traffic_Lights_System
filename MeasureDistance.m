function [Status,Exception,Distance] = MeasureDistance(yPixeList,distanceList,yPixelCentroidValue)

    try
        Status = true;
        Exception = 'No Error';
        %
        % p = polyfit(yPixeList,distanceList,5) 
        % n=5 less error than n = 3,4,6

        p = polyfit(yPixeList,distanceList,5);

        % 
        % after x = polyval(p,200) --> 200 is object yPixelCentroid Value
        %

        Distance = polyval(p,yPixelCentroidValue);
        
    catch exp
        
        Distance = -1;
        Status = false;
        msgString = getReport(exp);
        Exception = msgString;
        
    end  
end