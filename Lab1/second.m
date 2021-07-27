cc = ((0:10)' <= 3);

t2 = 0:1/16000:5;

s2 = s1.*(t2>2).*(t2<4);

figure;
plot(t2,s2); xlabel('t2'); ylabel('s2');

soundsc(s2,16000);