clc; clear; close all;

%% Read the file
[x, Fs] = audioread('whistle.wav'); % Read the file
N = length(x); % #samples
time = N/Fs; % Time of recording in sec

%% Plot frequency spectrum of signal x
X_k = abs(fft(x)); % Calculate FFT of x
f = linspace(0, Fs, N); % Discretize frequency
figure(1); plot(f, X_k); grid;
xlabel('Frequency (Hz)');
ylabel('|X(f)|');
title('Frequency Spectrum of Signal x');

%% Play original sound
sound(x, Fs);

%% Pause for 5 seconds
pause(5);

%% Design filter to reject noise frequencies
f1 = 500; % First noise frequency (Hz)
f2 = 1500; % Second noise frequency (Hz)
n = 1000; % Filter order
b = fir1(n, [f1-50, f1+50, f2-50, f2+50]/(Fs/2), 'stop'); % Design filter coefficients

%% Plot frequency response and impulse response of filter
[H, w] = freqz(b, 1, N, Fs); % Calculate frequency response
figure(2); plot(w, abs(H)); grid;
xlabel('Frequency (Hz)');
ylabel('|H(f)|');
title('Frequency Response of Filter');
figure(3); impz(b, 1); grid;
xlabel('Sample Number');
ylabel('Amplitude');
title('Impulse Response of Filter');

%% Filter signal x
y = filter(b, 1, x); % Filter x

%% Plot frequency spectrum of signal y
Y_k = abs(fft(y)); % Calculate FFT of filtered signal y
figure(4); plot(f, Y_k); grid;
xlabel('Frequency (Hz)');
ylabel('|Y(f)|');
title('Frequency Spectrum of Signal y');

%% Play filtered sound
sound(y, Fs);

%% Calculate energy of original and filtered signals
E_x = sum(x.^2); % Energy of original signal
E_y = sum(y.^2); % Energy of filtered signal
fprintf('Energy of original signal: %.4f\n', E_x);
fprintf('Energy of filtered signal: %.4f\n', E_y);