C = 10e-6;
Rs = 50;
Rg = 82;
Rl = 8.2;

t = -.001:0.000001:.005;

h = exp((-t/(Rl*C)))/(C*(Rs+Rg)).*(t>0);

plot(t, h); xlabel('Time, s'); ylabel('Voltage, mV');

vL1 = Rl/(Rs+Rg)*(1-exp(-t/(Rl*C))) .* ((0 < t) .* (t < .001));
vL2 = Rl/(Rs+Rg)*(exp((-t+.001)/(Rl*C))-exp(-t/Rl/C)) .* (t >= .001);

figure;
plot(t,(vL1+vL2)*10); xlabel('Time, s'); ylabel('Voltage, V');

input = 1 .* (t<.001);

Ts = .000001;

t2 = -.001:0.000001:.011;

convolution = conv(h,input)*Ts*10;

figure;
plot(t2,convolution); xlabel('Time, s'); ylabel('Voltage, V');