[x,Fs] = audioread('test.wav');
sound(x,Fs,16)
N = length(x);
time = N/Fs;
t = linspace(0,time,N); % discretize time
