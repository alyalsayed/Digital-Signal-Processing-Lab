fs = 8000; % sampling frequency
time = 1; % seconds
t = 0:(1/fs):time; % discretize time
N = length(t); % #samples
f0 = 1000; % signal frequency (Hz)
x = 0.1*cos(2*pi*f0*t); % scaling by 0.1

sound(x,fs);
figure(1);plot(t,x),grid;
xlabel('Time');
ylabel('Amplitude');
title('Time domain representation of x(t)');
xlim([0,0.01])

