% The following code allows your computer to process audio signals in
% MATLAB in real time. This was developed for use with the ECEn 487 class
% in the Winter 2013 semester.
%
% This code serves as a "wrapper" to set up the propper i/o handshaking
% between MATLAB and the PCs sound card.  You place your code inside the
% buffer loop where it says % Put your dsp code or function call here! %
% Note that real-time operation without data drop outs or queue overflow
% depends on the processor not being too busy with other tasks, so starting
% other programs, popping between windows, etc. will couse some data loss.
% 
% Brian Mazzeo
% bmazzeo@ee.byu.edu
% January 17, 20120000
%
% Modified January 18, 2013, Brian Jeffs
%
%

% These are important parameters for your sound card. They specify the
% sample rate and essentially the size of the block of data that you will
% periodically receive from the sound card.
SampleRate = 8000;
FrameSize = 15000;


% The real meat of the code is here. The reason that this is all preceded
% by a "try" statement is that when an error occurs, MATLAB will release
% the system resources that control the sound card. Otherwise, you often
% have to restart MATLAB.
try % VERY IMPORTANT

    % This sets up the characteristics of playback
    ap = dsp.AudioPlayer;
    set(ap, 'SampleRate', SampleRate);
    set(ap, 'BufferSizeSource', 'Property');
    set(ap, 'BufferSize', FrameSize);
    set(ap, 'QueueDuration', 0.3);

    % This sets up the characteristics of recording
    ar = dsp.AudioRecorder;
    set(ar, 'DeviceDataType', '16-bit integer');
    set(ar, 'SamplesPerFrame', FrameSize);
    set(ar, 'SampleRate', SampleRate);

    % This records the first set of data
    disp('Starting processing');
    input_data = step(ar); % This gets the first block of data from the sound card.
    loop_count = 0;
    while loop_count <= 100
        loop_count = loop_count + 1;
        
        %%%%%% Put your dsp code or function call here! %%%%%%%%%%%%%%%%%%%%
        y_data = input_data;
   
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        step(ap, y_data);
        input_data = step(ar);        
    end

    % You want to make sure that you release the system resources after using
    % them and they don't get tied up.
    release(ar)
    release(ap)

    % The following statements are really important so that you don't cause
    % problems and hang system resources when you actually terminate inside of
    % the loop. Otherwise, you need to restart MATLAB if you hit certain kinds
    % of errors.
    catch err 
        release(ar)
        release(ap)
        rethrow(err)
    end
