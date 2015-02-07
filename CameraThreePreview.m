function[Status,Exception] = CameraThreePreview(videoAdapter,cameraFormat,cameraID)

    global vidObjectThree;
    vidObjectThree = 0;
    try
        
        Status = true;
        Exception = 'No Errors';    
        % Capture the video frames using the videoinput function
        % You have to replace the resolution & your installed adaptor name.
        vidObjectThree = videoinput(videoAdapter,cameraID,cameraFormat);
        % Set the properties of the video object
        %set(vidObjectThree, 'FramesPerTrigger', Inf);
        set(vidObjectThree, 'ReturnedColorspace', 'rgb')
        %set(vidObjectThree, 'ReturnedColorspace', 'YCbCr')
        vidObjectThree.FrameGrabInterval = 1;
        src.Exposure = 0; % changes exposure - chage the frame rate lower
        start(vidObjectThree);
        % Display the image
        subplot(2,2,3)
        h3 = image; % create image object
        axis ij % flip the image
        preview(vidObjectThree,h3) % display 1st webcam preview
     
    catch exception
        
        Status = false;
        msgString = getReport(exception);
        Exception = msgString;
        ExceptionFunction(exception);
        if(vidObjectThree ~= 0)
        stop(vidObjectThree);
        end
        
    end
    
end