function [Status,Exception] = PrintGrid(strImage,cameraID)
    try
        Exception = 'No Errors';     
        rgbImage = imread(strImage); 
        M = size(rgbImage,1);
        N = size(rgbImage,2);
        
        Status = (M >= 480 & N>= 640);

        if(~Status)  
            rgbImage = imresize(rgbImage , [480 640]);
        end
        
        f = figure('visible','off');
        image(rgbImage);
        hold on;
        
        %for k = 1:25:M
        for k = 480:-20:0
        x = [1 N];
        y = [k k];
        line(x,y,'Color','w','LineStyle','-');
        line(x,y,'Color','r','LineStyle',':');
        end

        %for k = 1:25:N
         for k = 640:-20:0
            x = [k k];
            y = [1 M];
            line(x,y,'Color','w','LineStyle','-');
            line(x,y,'Color','r','LineStyle',':');
         end

        str = strcat(['Cam_',num2str(cameraID),'_Grid','.png']);
        set(gca, 'visible', 'off', 'position', [0 0 1 1]);
        print(f,'-r80','-dpng',str);

    catch exp
        
        Status = false;
        msgString = getReport(exp);
        Exception = msgString;
        ExceptionFunction(exp);
        
    end
end

