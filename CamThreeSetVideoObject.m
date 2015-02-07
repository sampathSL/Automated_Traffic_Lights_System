function CamThreeSetVideoObject(vidAdapter,vidFormat,deviceID)
    
    try
        
        global vidObjectThree;
        global expFileThree;

        hwInfo = imaqhwinfo(vidAdapter);
        device1 = hwInfo.DeviceInfo(deviceID);
        cameraID= device1.DeviceID;

        % Capture the video frames using the videoinput function
        % You have to replace the resolution & your installed adaptor name.
        vidObjectThree = videoinput(vidAdapter,cameraID,vidFormat);

        % Set the properties of the video object
        set(vidObjectThree, 'FramesPerTrigger', Inf);
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
        
    catch exp
        
        strDate = datestr(now);
        msgString = getReport(exp);
        strobject = sprintf('%s -- %s\n',strDate,msgString);
        fid = fopen(expFileThree,'a');
        fprintf(fid, '%s\n', strobject);
        fclose(fid);
        
    end
    
end