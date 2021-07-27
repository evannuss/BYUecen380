clc, clear, close all;

recObj = audiorecorder(96000, 24, 1); % (sampling rate, bits/sample, channels)
disp('Start speaking.'); % This just outputs text
recordblocking(recObj, 5); % This does the recording/sampling, for 5 seconds
disp('End of Recording.');

%play(recObj); % This directly plays back the recording using the recording sampling rate

myRecording = getaudiodata(recObj); % Grab the sampled data from recObj

figure;
plot(myRecording);
xlabel('Time (s)');
ylabel('Magnitude');

player = audioplayer(myRecording, 120000); % 2nd param plays back at 96,000 samples/s
playblocking(player); % Actually plays the sound in object player back

impulse_echo = zeros(192000,1);
impulse_echo(1) = 1; % A delta at the beginning of our impulse response
impulse_echo(48000) = 0.5; % A smaller (softer) one after 0.5 seconds (48,000 samples)
impulse_echo(96000) = 0.25;

figure;
plot(impulse_echo);
xlabel('Time (s)');
ylabel('Magnitude');

player = audioplayer(impulse_echo, 96000);
playblocking(player);

myRecording_echo = conv(myRecording, impulse_echo); % This will be a bit slow...

player = audioplayer(myRecording_echo, 70000);
playblocking(player);
%%
impulse_great_hall = audioread('great_hall.wav');
player = audioplayer(impulse_great_hall, 96000);
playblocking(player);

impulse_octagon = audioread('octagon.wav');
player = audioplayer(impulse_octagon, 96000);
playblocking(player);

impulse_classroom = audioread('classroom.wav');
player = audioplayer(impulse_classroom, 96000);
playblocking(player);


figure;
subplot(3,1,1);
plot(impulse_great_hall);
ylabel('Magnitude');
subplot(3,1,2);
plot(impulse_octagon);
ylabel('Magnitude');
subplot(3,1,3);
plot(impulse_classroom);
xlabel('Time (s)');
ylabel('Magnitude');

%% Task 1 Pass-Off Section

recObj = audiorecorder(96000, 24, 1); % (sampling rate, bits/sample, channels)
disp('Start speaking.'); % This just outputs text
recordblocking(recObj, 5); % This does the recording/sampling, for 5 seconds
disp('End of Recording.');

myRecording = getaudiodata(recObj); % Grab the sampled data from recObj

myRecording_own = conv(myRecording, impulse_echo);

player = audioplayer(myRecording_own, 96000);
playblocking(player);

myRecording_greatHall = conv(myRecording, impulse_great_hall);

player = audioplayer(myRecording_greatHall, 96000);
playblocking(player);

myRecording_octagon = conv(myRecording, impulse_octagon);

player = audioplayer(myRecording_octagon, 96000);
playblocking(player);

myRecording_classroom = conv(myRecording, impulse_classroom);

player = audioplayer(myRecording_classroom, 96000);
playblocking(player);

%% Extra Credit

recObj = audiorecorder(96000, 24, 1); % (sampling rate, bits/sample, channels)
disp('Start speaking.'); % This just outputs text
recordblocking(recObj, 5); % This does the recording/sampling, for 5 seconds
disp('End of Recording.');

myRecording = getaudiodata(recObj); % Grab the sampled data from recObj

impulse_balloon = audioread('balloon.wav');

myRecording_balloon = conv(myRecording, impulse_balloon(:,1));

player = audioplayer(myRecording_balloon, 96000);
playblocking(player);

figure;
plot(impulse_balloon(:,1));
xlabel('Time (s)');
ylabel('Magnitude');
