clc, clear, close all;

z = -3 - 4j;
z_real = real(z); z_imag = imag(z);

z_mag = abs(z);

z_rad = angle(z);

z_deg = z_rad*180/pi;

k = 0:99; w = exp(1j*(pi/100 + 2*pi*k/100));
w(5);

t = 0:0.2/500:0.2-0.2/500;
f = sin(2*pi*10*t+pi/6);
%f(1);

figure; 
plot(t,f);
xlabel('t'); ylabel('f(t)');

figure; 
plot(real(w),imag(w),'o');
xlabel('Re(w)'); ylabel('Im(w)'); axis equal;

g = exp(-10*t);
h = f.*g;

figure;
plot(t,f,'-k',t,h,':k');
xlabel('t'); ylabel('Amplitude');
legend('f(t)','h(t)');

r = [1 0 0];
%A = [2 3;4 5; 0 6];

c = r';
%B = [c A];
%B(1,2);
%B(1:2,2:3);
%B(2,:);

A = [1 -2 3;-sqrt(3) 1 -sqrt(5);3 -sqrt(7) 1]; y = [1;pi;exp(1)];
x = A\y;

x1 = det([y,A(:,2:3)])/det(A);
A(:,2:3);

alpha = (0:10);
t = (0:0.001:0.2)';
T = t*ones(1,11);
H = exp(-T*diag(alpha)).*sin(2*pi*10*T+pi/6);

figure;
plot(t,H); xlabel('t'); ylabel('h(t)');

