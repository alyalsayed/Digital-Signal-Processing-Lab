% Sampling frequency
Fs = 10000;

% Butterworth filter parameters
n1 = 4;     % filter order for n=4
n2 = 21;    % filter order for n=21
fc1 = [200 2000];   % band pass frequencies

% Design the Butterworth filters
[b1, a1] = butter(n1, fc1/(Fs/2), 'bandpass');
[b2, a2] = butter(n2, fc1/(Fs/2), 'bandpass');

% Plot the frequency response of the filter with n=4
f = linspace(0, Fs/2, 1024);
H1 = freqz(b1, a1, f, Fs);
figure;
subplot(2, 1, 1);
plot(f, abs(H1));
xlabel('Frequency (Hz)');
ylabel('|H(f)|');
title('Frequency Response of Butterworth Filter (n=4)');
grid on;

% Plot the frequency response of the filter with n=21
H2 = freqz(b2, a2, f, Fs);
subplot(2, 1, 2);
plot(f, abs(H2));
xlabel('Frequency (Hz)');
ylabel('|H(f)|');
title('Frequency Response of Butterworth Filter (n=21)');
grid on;

% Plot the impulse response of the filter with n=4
figure;
subplot(2, 1, 1);
impz(b1, a1);
xlabel('n (samples)');
ylabel('h(n)');
title('Impulse Response of Butterworth Filter (n=4)');
grid on;

% Plot the impulse response of the filter with n=21
subplot(2, 1, 2);
impz(b2, a2);
xlabel('n (samples)');
ylabel('h(n)');
title('Impulse Response of Butterworth Filter (n=21)');
grid on;

% Check stability of the filters
if isstable(b1, a1)
    disp('Filter with n=4 is stable');
else
    disp('Filter with n=4 is unstable');
end

if isstable(b2, a2)
    disp('Filter with n=21 is stable');
else
    disp('Filter with n=21 is unstable');
end