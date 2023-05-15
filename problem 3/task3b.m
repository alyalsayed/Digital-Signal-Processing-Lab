b = [1/8 0 0 0 0 0 0 0 -1/8];
a = [1 -1];
[H, w] = freqz(b, a);
figure; 
subplot(2,1,1); plot(w, abs(H)); grid; 
xlabel('Normalized Frequency (\pi radians/sample)'); 
ylabel('|H(e^{j\omega})|');
title('Magnitude Response of Filter');
subplot(2,1,2); plot(w, angle(H)); grid; 
xlabel('Normalized Frequency (\pi radians/sample)'); 
ylabel('\angle H(e^{j\omega})');
title('Phase Response of Filter');

impz(b, a);
xlabel('Sample Number');
ylabel('Amplitude');
title('Impulse Response of Filter');

if isstable(b, a)
    disp('Filter is stable');
else
    disp('Filter is unstable');
end