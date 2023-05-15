close all ; clear ; clc
% Prefered to use Fs = 8000, 11025, 22050, 44100 Hz
Fs = 8000;
time = 5; 
recObj = audiorecorder(Fs, 16, 1);
recordblocking(recObj, time); %stop prog. &record
x = getaudiodata(recObj);
play(recObj);

N = length(x); % #samples
t = linspace(0,time,N); % discretize time
figure(1);plot(t,x),grid;
xlabel('Time');
ylabel('Amplitude');
title('Time domain representation of x(t)');
xlim([0,0.1]);
audiowrite('test.wav',x,Fs)