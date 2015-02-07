function CamTwoSetVideoObject(vidAdapter,vidFormat,deviceID)
    
    try
        
        global vidObjectTwo;
        global expFileTwo;

        hwInfo = imaqhwinfo(vidAdapter);
        device1 = hwInfo.DeviceInfo(deviceID);
        cameraID = device1.DeviceID;

        % Capture the video frames using the videoinput function
        % You have to replace the resolution & your installed adaptor name.
        vidObjectTwo = videoinput(vidAdapter,cameraID,vidFormat);

        % Set the properties of the video object
        set(vidObjectTwo, 'FramesPerTrigger', Inf);
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
        
    catch exp
        
        strDate = datestr(now);
        msgString = getReport(exp);
        strobject = sprintf('%s -- %s\n',strDate,msgString);
        fid = fopen(expFileTwo,'a');
        fprintf(fid, '%s\n', strobject);
        fclose(fid);
        
    end
    
end