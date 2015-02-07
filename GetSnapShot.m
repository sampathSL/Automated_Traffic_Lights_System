function [Status,Exception] = GetSnapShot(videoAdapter,cameraFormat,cameraID,checkImgWrite,isResizeNeed)
vid = 0;
try
    % Capture the video frames using the videoinput function
    % You have to replace the resolution & your installed adaptor name.

    % Set the properties of the video object
    vid = videoinput(videoAdapter,cameraID,cameraFormat);
    set(vid, 'FramesPerTrigger',Inf);
    set(vid, 'ReturnedColorspace', 'rgb')
    vid.FrameGrabInterval = 1;

    %start the video aquisition here
    start(vid);
    
    while(vid.FramesAcquired <= 10)
            pause(0.5);
            % Get the snapshot of the current frame
            backImage = getsnapshot(vid);
    end
    
    if(checkImgWrite)
            
            if(isResizeNeed)
                backImage = imresize(backImage , [480 640]);
            end
       
            str = strcat(['Cam_',num2str(cameraID),'_Background','.png']);
            imwrite(backImage,str);
            
    end
    
    stop(vid);
    Status = true;
    Exception = 'No Error';

catch exp

    Status = false;
    msgString = getReport(exp);
    Exception = msgString;
    ExceptionFunction(exp);
    if(vid ~= 0)
    stop(vid);
    end
    
end
end