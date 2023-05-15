n = 50; % filter order
fc = 3000; % filter cutoff frequency
Fs=8000;
a = 1;
% Choose filter type 'low','high','bandpass','stop'
% b = 0.25*[1, 1,1, 1]

b = fir1(n,fc/(Fs/2),'low');
%b = fir1(n,fc/(Fs/2),'high');
%b = fir1(n,[500 1500]/(Fs/2),'bandpass');
%b = fir1(n,[500 1500]/(Fs/2),'stop');
figure;impz(b,a,10);
f = (0:.001:1)*Fs/2;
H = freqz(b,a,f,Fs);
figure;plot(f,abs(H)),grid;
xlabel('Physical Frequency f (Hz)')
ylabel('Frequency Responce |H|')
