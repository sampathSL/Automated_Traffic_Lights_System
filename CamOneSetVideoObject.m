function CamOneSetVideoObject(vidAdapter,vidFormat,deviceID)
    
    try
        
        global vidObjectOne;
        global expFileOne;

        hwInfo = imaqhwinfo(vidAdapter);
        device1 = hwInfo.DeviceInfo(deviceID);
        cameraID= device1.DeviceID;

        % Capture the video frames using the videoinput function
        % You have to replace the resolution & your installed adaptor name.
        vidObjectOne = videoinput(vidAdapter,cameraID,vidFormat);

        % Set the properties of the video object
        set(vidObjectOne, 'FramesPerTrigger', Inf);
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
        
    catch exp
        
        strDate = datestr(now);
        msgString = getReport(exp);
        strobject = sprintf('%s -- %s\n',strDate,msgString);
        fid = fopen(expFileOne,'a');
        fprintf(fid, '%s\n', strobject);
        fclose(fid);
        
    end
    
end