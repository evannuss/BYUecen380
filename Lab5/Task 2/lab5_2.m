clc, clear, close all;

recObj = audiorecorder(48000, 24, 1); % (sampling rate, bits/sample, channels)
disp('Start speaking.'); % This just outputs text
recordblocking(recObj, 5); % This does the recording/sampling, for 5 seconds
disp('End of Recording.');

%play(recObj); % This directly plays back the recording using the recording sampling rate

myRecording = getaudiodata(recObj); % Grab the sampled data from recObj

my8kHzRecording = myRecording(1:6:length(myRecording));
player = audioplayer(my8kHzRecording,8000); 
playblocking(player); % Actually plays the sound in object player back

fs = 8000; % sampling frequency
ww = -pi:0.0001:pi; % identify which frequencies you’d like to test
XX = freqz(my8kHzRecording,1,ww); % calculate the frequency response
ff = ww*fs/(2*pi); % convert the frequency vector to Hz
figure
plot(ff,(20*log10(abs(XX)))); % plot the magnitude response in dB
xlabel('Hz');
ylabel('dB');

%% part 4

clc, clear, close all;

recObj = audiorecorder(8000, 24, 1); % (sampling rate, bits/sample, channels)
disp('Start speaking.'); % This just outputs text
recordblocking(recObj, 7); % This does the recording/sampling, for 5 seconds
disp('End of Recording.');

play(recObj); % This directly plays back the recording using the recording sampling rate

myRecording = getaudiodata(recObj); % Grab the sampled data from recObj

my8kHzRecording = myRecording(1:6:length(myRecording));
player = audioplayer(my8kHzRecording,8000); % 2nd param plays back at 96,000 samples/s
%playblocking(player); % Actually plays the sound in object player back

fs = 8000; % sampling frequency
ww = -pi:0.0001:pi; % identify which frequencies you’d like to test
XX = freqz(my8kHzRecording,1,ww); % calculate the frequency response
ff = ww*fs/(2*pi); % convert the frequency vector to Hz
figure
plot(ff,(20*log10(abs(XX)))); % plot the magnitude response in dB
xlabel('Hz');
ylabel('dB');

%% part 5a
clc, clear, close all;

recObj = audiorecorder(48000, 24, 1); % (sampling rate, bits/sample, channels)
disp('Start speaking.'); % This just outputs text
recordblocking(recObj, 10); % This does the recording/sampling, for 5 seconds
disp('End of Recording.');

%play(recObj); % This directly plays back the recording using the recording sampling rate

myRecording = getaudiodata(recObj); % Grab the sampled data from recObj

my8kHzRecording = myRecording(1:6:length(myRecording));
player = audioplayer(my8kHzRecording,8000); % 2nd param plays back at 96,000 samples/s
playblocking(player); % Actually plays the sound in object player back

fs = 8000; % sampling frequency
ww = -pi:0.0001:pi; % identify which frequencies you’d like to test
XX = freqz(my8kHzRecording,1,ww); % calculate the frequency response
ff = ww*fs/(2*pi); % convert the frequency vector to Hz
figure
plot(ff,(20*log10(abs(XX)))); % plot the magnitude response in dB
xlabel('Hz');
ylabel('dB');
