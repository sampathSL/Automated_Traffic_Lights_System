function[Status,Exception] =  MarkPoints(fullImageFileName,pointX,pointY,cameraID)
try
    Exception = 'No Errors';
    [indexArray positions] =  size(pointX);
    [rgbImage storedColorMap] = imread(fullImageFileName);
    f = figure('visible','off');
    image(rgbImage);
    hold on;
    Status = (positions > 0);
    
    if(Status)
        
        for  numF = 1:positions
            positionX = pointX(1,numF);
            positionY = pointY(1,numF);
            %line(positionX,positionY,'Color','r','LineStyle','*','LineWidth',6);
            plot(positionX,positionY,'--gs','LineWidth',2,'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',10);
        end
        
    else
        
        Status = false;
        Exception = 'No Positions to Print';
        
    end
    
    set(gca, 'visible', 'off', 'position', [0 0 1 1]);
    str = strcat(['Cam_',num2str(cameraID),'_Points_Print','.png']);
    print(f,'-r80','-dpng', str); 
    
catch exp
    
    Status = false;
    msgString = getReport(exp);
    Exception = msgString;
    ExceptionFunction(exp);
    
end
end
