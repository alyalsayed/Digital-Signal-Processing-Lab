clc;clear;close all
%% 1.	Record voice from Microphone:
% Prefered to use Fs = 8000, 11025, 22050, 44100 Hz
Fs = 44100;					% sampling frequency
time = 3; 					% seconds
recObj = audiorecorder(Fs, 16, 1);
recordblocking(recObj, time);%stop prog. & record	
x = getaudiodata(recObj);
N = length(x);      		% #samples
t = linspace(0,time,N);		% discretize time
%% 2.	Play the signal
sound(x,Fs)		% Convert signal data to sound
pause(time)
%% 3.	Plot it in time domain:
figure(1);plot(t,x),grid;
xlabel('Time')
ylabel('Amplitude')
title('Time domain representation of x(t)')
%% 4.	Get FFT and plot absolute spectrum:
X_k = abs(fft(x)); 		% calculate absolute of fft 
f = linspace(0,Fs,N);	% discretize frequency
figure(2);plot(f,X_k),grid;
title('Amplitude Spectrum of x(t)')
xlabel('Frequency (Hz)')
ylabel('|X(f)|')
%% FIR filter design
n = 100;        	% filter order
fc = 1500;
% Choose filter type 'low','high','bandpass','stop'
a = 1;
b = fir1(n,fc/(Fs/2),'low');
%% Impulse response
figure(3);impz(b,a),grid;
%% Frequency response
f = (0:.001:1)*Fs/2;
H = freqz(b,a,f,Fs);
figure(4);plot(f,abs(H)),grid;
xlabel('Physical Frequency f (Hz)')
ylabel('Frequency Responce |H|')
%% filter the signal
y = filter(b,a,x);
sound(y,Fs)		% Convert signal data to sound
%% 3.	Plot it in time domain:
figure(5);plot(t,y),grid;
xlabel('Time')
ylabel('Amplitude')
title('Time domain representation of y(t)')
%% 4.	Get FFT and plot absolute spectrum:
Y_k = abs(fft(y)); 		% calculate absolute of fft 
f = linspace(0,Fs,N);	% discretize frequency
figure(6);plot(f,Y_k),grid;
title('Amplitude Spectrum of y(t)')
xlabel('Frequency (Hz)')
ylabel('|X(f)|')







