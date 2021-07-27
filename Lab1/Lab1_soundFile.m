t = 0:1/16000:5;
s1 = cos(2*pi*400*t);
%soundsc(s1,16000);
%soundsc(s1,67860);
%audiowrite('sound1.wav',s1,16000);
%audiowrite('sound2.wav',s1,48000);
t1 = 0:1/16000:1;
for k=100:100:1000
    s = cos(2*pi*k*t1);
    soundsc(s,16000);
    pause(1);
end