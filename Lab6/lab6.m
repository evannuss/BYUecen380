clc, clear, close all;

%Task 1 Part 2

N = 81; % total number of samples in the filter
L = (N-1)/2; % the filter will go from -L to L
n = (-L:L); % this is our sample index
f_corner = 4600; % corner frequency of our low-pass filter in Hz
f_s = 100000; % our sampling frequency in Hz
h_rect_FIR = 2*f_corner/f_s*sinc(n*2*f_corner/f_s); % truncated sinc
% IMPORTANT: in the code above we convert f_corner from
% Hz to cycles/sample by dividing by f_s
figure;
subplot(4,1,1);
stem(n, h_rect_FIR);
title('rect');

%Hamming window impulse response
hamWindow = transpose(hamming(N));
h_ideal = 2*f_corner/f_s*sinc(n*2*f_corner/f_s);
h_ham = h_ideal .* hamWindow;
subplot(4,1,2);
stem(n, h_ham);
title('hamming');

%Bartlett window impulse response
barWin = transpose(bartlett(N));
h_bar = h_ideal .* barWin;
subplot(4,1,3);
stem(n, h_bar);
title('bartlett');

%Blackman window impulse response
blackWin = transpose(blackman(N));
h_black = h_ideal .* blackWin;
subplot(4,1,4);
stem(n, h_black);
title('blackman');

%%
f_axis = linspace(0, 10000, 2000); % frequency axis with 2000 points
H_rect_FIR = freqz(h_rect_FIR, 1, f_axis, f_s);
% IMPORTANT: in the code above, the first two parameters
% to freqz are the ‘b’ and ‘a’ coefficients for the filter.
% Remember that the ‘b’ coefficients for an FIR filter
% are just the impulse response values, and a 0 = 1 while
% all of the other ‘a’ coefficients are zero.
figure;
plot(f_axis, 20*log10(abs(H_rect_FIR)));
xlabel('frequency (Hz)'); ylabel('magnitude (dB)');

%Hamming window freq response
hold on;
H_ham = freqz(h_ham, 1, f_axis, f_s);
plot(f_axis, 20*log10(abs(H_ham)),'--k');

%Bartlett window freq response
hold on;
H_bar = freqz(h_bar, 1, f_axis, f_s);
plot(f_axis, 20*log10(abs(H_bar)), ':k');

%Blackman window freq response
hold on;
H_black = freqz(h_black, 1, f_axis, f_s);
plot(f_axis, 20*log10(abs(H_black)), '-.k');
legend('rect', 'hamming', 'bartlett', 'blackman');

%%
t = 0:1/f_s:(0.5-1/f_s); % time axis in seconds
sin1 = sin(2*pi*4000*t); % sinusoid at 4 kHz
sin2 = sin(2*pi*4600*t); % sinusoid at 4.6 kHz
sin3 = sin(2*pi*6000*t); % sinusoid at 6 kHz
sin4 = sin(2*pi*25000*t); % sinusoid at 25 kHz
sin5 = sin(2*pi*40000*t); % sinusoid at 40 kHz
s1 = sin1+sin2+sin3+sin4+sin5; % create the overall signal

S1 = fft(s1); % take the FFT of the signal s1
f1 = linspace(0, 50000, length(S1)/2); % freq axis from 0 to 50 kHz
figure;
plot(f1, abs(S1(1:length(S1)/2)));
xlabel('frequency (Hz)'); ylabel('magnitude');

%%

fft_rect = fft(filter(h_rect_FIR, 1, s1));
figure;
subplot(4,1,1);
plot(f1, 20*log10(abs(fft_rect(1:length(fft_rect)/2))));
title('rect');
ylabel('magnitude (dB)');

fft_ham = fft(filter(h_ham, 1, s1));
subplot(4,1,2);
plot(f1, 20*log10(abs(fft_ham(1:length(fft_ham)/2))));
title('hamming');
ylabel('magnitude (dB)');

fft_bar = fft(filter(h_bar, 1, s1));
subplot(4,1,3);
plot(f1, 20*log10(abs(fft_bar(1:length(fft_bar)/2))));
title('bartlett');
ylabel('magnitude (dB)');

fft_black = fft(filter(h_black, 1, s1));
subplot(4,1,4);
plot(f1, 20*log10(abs(fft_black(1:length(fft_black)/2))));
title('blackman');
xlabel('frequency (Hz)'); ylabel('magnitude (dB)');

