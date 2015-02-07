function[Status,Exception] = CameraOnePreview(videoAdapter,cameraFormat,cameraID)

    global vidObjectOne;
    vidObjectOne = 0;
    try
        
        Status = true;
        Exception = 'No Errors';
        % Capture the video frames using the videoinput function
        % You have to replace the resolution & your installed adaptor name.
        vidObjectOne = videoinput(videoAdapter,cameraID,cameraFormat);
        % Set the properties of the video object
        %set(vidObjectOne, 'FramesPerTrigger', Inf);
        set(vidObjectOne, 'ReturnedColorspace', 'rgb')
        %set(vidObjectOne, 'ReturnedColorspace', 'YCbCr')
        vidObjectOne.FrameGrabInterval = 1;
        src.Exposure = 0; % changes exposure - chage the frame rate lower 
        start(vidObjectOne);
        % Display the image
        subplot(2,2,1)
        h1 = image; % create image object
        axis ij % flip the image
        preview(vidObjectOne,h1) % display 1st webcam preview

    catch exception
        
        Status = false;
        msgString = getReport(exception);
        Exception = msgString;
        ExceptionFunction(exception);
        if(vidObjectOne ~= 0)
        stop(vidObjectOne);
        end
        
    end 
end