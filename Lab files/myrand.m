Fs = 8000; % sampling frequency
time = 1; % seconds
N = time*Fs; % #samples
x = rand(1,N)*2-1; % Uniformly distributed..
% .. random signal
t = linspace(0,time,N); % discretize time

sound(x,Fs);
figure(1);plot(t,x),grid;
xlabel('Time');
ylabel('Amplitude');
title('Time domain representation of x(t)');
xlim([0,0.01])