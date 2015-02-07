%  -------------------------
%                          -
%                          -
%                          -
%                          -
%                          -
%                          -
%  -------------------------      
%



function [Status,Exception,laneOne,laneTwo] = DrawRoad(fullImageFileName,roadPostions,cameraID)
    try
        Exception = 'No Errors';
        [indexArray positions] =  size(roadPostions);  
        [rgbImage storedColorMap] = imread(fullImageFileName);
        %rgbImage = imresize(rgbImage , [480 640]);
        f = figure('visible','off');
        image(rgbImage);
        hold on;
        
        Status = (positions == 8);
        if(Status)
            
            positionsX = [roadPostions(1,1) roadPostions(1,2) roadPostions(1,3) roadPostions(1,4)];
            positionsY = [roadPostions(1,5) roadPostions(1,6) roadPostions(1,7) roadPostions(1,8)];
            line(positionsX,positionsY,'Color','r','LineStyle','*','LineWidth',6);
            
%             laneOneX = [roadPostions(1,1) roadPostions(1,2) (roadPostions(1,2)+ ((roadPostions(1,3) - roadPostions(1,2))/2) - 2) (roadPostions(1,1) + ((roadPostions(1,4) - roadPostions(1,1))/2) - 2) roadPostions(1,1)];
%             laneOneY = [roadPostions(1,5) roadPostions(1,6) roadPostions(1,7) roadPostions(1,8) roadPostions(1,5)];
%             line(laneOneX,laneOneY,'Color','g','LineStyle','-','LineWidth',2);
%             c = text(roadPostions(1,2),roadPostions(1,6) - 10, strcat('Lane: ', num2str(2)));
%             set(c, 'FontName', 'Arial', 'FontWeight', 'bold', 'FontSize', 12,'Color', 'red');
%             laneOne = [laneOneX laneOneY];
%             
%             
%             laneTwoX = [(roadPostions(1,1) + ((roadPostions(1,4) - roadPostions(1,1))/2) + 2) (roadPostions(1,2)+ ((roadPostions(1,3) - roadPostions(1,2))/2) + 2) roadPostions(1,3) roadPostions(1,4) (roadPostions(1,1) + ((roadPostions(1,4) - roadPostions(1,1))/2) + 2)];
%             laneTwoY = [roadPostions(1,5) roadPostions(1,6) roadPostions(1,7) roadPostions(1,8) roadPostions(1,5)];
%             line(laneTwoX,laneTwoY,'Color','g','LineStyle','-','LineWidth',2);
%             c = text((roadPostions(1,2)+ ((roadPostions(1,3) - roadPostions(1,2))/2) + 2),roadPostions(1,6) - 10, strcat('Lane: ', num2str(2)));
%             set(c, 'FontName', 'Arial', 'FontWeight', 'bold', 'FontSize', 12,'Color', 'red');
%             laneTwo = [laneTwoX laneTwoY];

            laneOneX = [(roadPostions(1,1)) (roadPostions(1,1)+((roadPostions(1,2) - roadPostions(1,1))/2) - 7.5)  (roadPostions(1,4) + ((roadPostions(1,3) - roadPostions(1,4))/2)- 7.5)  (roadPostions(1,4)) (roadPostions(1,1))];
            laneOneY = [roadPostions(1,5) roadPostions(1,6) roadPostions(1,7) roadPostions(1,8) roadPostions(1,5)];
            line(laneOneX,laneOneY,'Color','g','LineStyle','-','LineWidth',2);
            c = text(roadPostions(1,1),roadPostions(1,5) - 10, strcat('Lane: ', num2str(1)));
            set(c, 'FontName', 'Arial', 'FontWeight', 'bold', 'FontSize', 12,'Color', 'red');
            laneOne = [laneOneX laneOneY];
            
            
            laneTwoX = [(roadPostions(1,1)+((roadPostions(1,2) - roadPostions(1,1))/2) + 7.5) roadPostions(1,2)  roadPostions(1,3) (roadPostions(1,4) + ((roadPostions(1,3) - roadPostions(1,4))/2) + 7.5) (roadPostions(1,1)+((roadPostions(1,2) - roadPostions(1,1))/2) + 7.5)];
            laneTwoY = [roadPostions(1,5) roadPostions(1,6) roadPostions(1,7) roadPostions(1,8) roadPostions(1,5)];
            line(laneTwoX,laneTwoY,'Color','g','LineStyle','-','LineWidth',2);
            c = text((roadPostions(1,1)+((roadPostions(1,2) - roadPostions(1,1))/2) + 2), roadPostions(1,5) - 10, strcat('Lane: ', num2str(2)));
            set(c, 'FontName', 'Arial', 'FontWeight', 'bold', 'FontSize', 12,'Color', 'red');
            laneTwo = [laneTwoX laneTwoY];
            
        end
        
        set(gca, 'visible', 'off', 'position', [0 0 1 1]);
        str = strcat(['Cam_',num2str(cameraID),'_M_Road_Edge_Drawn','.png']);
        print(f,'-r80','-dpng', str); 
        
    catch exp
        
        laneOne = 0;
        laneTwo = 0;
        Status = false;
        msgString = getReport(exp);
        Exception = msgString;
        ExceptionFunction(exp);
        
    end
end