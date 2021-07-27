clc, clear, close all;
load lab3data.mat
rmean = mean(resistors);
cmean = mean(capacitors);

rvar = var(resistors);
cvar = var(capacitors);

figure;
hist(resistors); 
xlabel('Resistance (ohms)'); ylabel('# of resistors');

figure;
hist(capacitors);
xlabel('Capacitance, uF'); ylabel('# of capacitors');

curr = 1;
for j = 1:70
    for k = 1:70
        wc(curr) = 1/(resistors(j)*(capacitors(k)*10^-6));
        curr = curr+1;
    end
end

figure;
hist(wc);
xlabel('Corner Frequency (rad/s)'); ylabel('# of RC Combinations');

figure;
hist(wc/(2*pi));
xlabel('Corner Frequency (Hz)'); ylabel('# of RC Combinations');