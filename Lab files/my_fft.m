
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
 % audiowrite('test.wav',x,Fs)

N=length(x);
X_k = abs(fft(x)); % calculate absolute of fft 
f = linspace(0,Fs,N); % discretize frequency
figure(2);plot(f,X_k),grid;
title('Amplitude Spectrum of x(t)')
xlabel('Frequency (Hz)')
ylabel('|X(f)|')