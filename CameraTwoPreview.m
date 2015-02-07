function[Status,Exception] = CameraTwoPreview(videoAdapter,cameraFormat,cameraID)

    global vidObjectTwo;
    vidObjectTwo = 0;
    try
        
        Status = true;
        Exception = 'No Errors';
        % Capture the video frames using the videoinput function
        % You have to replace the resolution & your installed adaptor name.
        vidObjectTwo = videoinput(videoAdapter,cameraID,cameraFormat);
        % Set the properties of the video object
        %set(vidObjectTwo, 'FramesPerTrigger', Inf);
        set(vidObjectTwo, 'ReturnedColorspace', 'rgb')
        %set(vidObjectTwo, 'ReturnedColorspace', 'YCbCr')
        vidObjectTwo.FrameGrabInterval = 1;
        src.Exposure = 0; % changes exposure - chage the frame rate lower
        start(vidObjectTwo);
        % Display the image
        subplot(2,2,2)
        h2 = image; % create image object
        axis ij % flip the image
        preview(vidObjectTwo,h2) % display 1st webcam preview
    
    catch exception
        
        Status = false;
        msgString = getReport(exception);
        Exception = msgString;
        ExceptionFunction(exception);
        if(vidObjectTwo ~= 0)
        stop(vidObjectTwo);
        end
        
    end 
    
end