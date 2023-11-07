clear all;
close all;
% Συχνότητα δειγματοληψίας
Fs = 128; % Hz

% Δημιουργία ενός διανύσματος χρόνου t με 128 δείγματα
t = 0:1/Fs:1 - 1/Fs; % Διάρκεια 1 δευτερολέπτου, 128 δείγματα

% Δημιουργία του σήματος x(t)
x_t = 10*cos(2*pi*20*t) - 4*sin(2*pi*40*t+5);

% Σχεδίαση του φάσματος συχνοτήτων
f = (-Fs/2):(Fs/length(t)):(Fs/2-Fs/length(t));
X_f = fftshift(fft(x_t));

figure;
plot(f, abs(X_f));
title('Φάσμα Συχνοτήτων');
xlabel('Συχνότητα (Hz)');
ylabel('Μέτρο');



%Β1

% Συχνότητα δειγματοληψίας
fs = 8000; % 8 KHz

% Συχνότητες f0 από 100 Hz έως 475 Hz με βήμα 125 Hz
f0_values = 100:125:475;

figure;
for i = 1:length(f0_values)
    f0 = f0_values(i);
    t = 0:1/fs:0.01; % Διάρκεια 0.01 δευτερολέπτου
    x_t = sin(2*pi*f0*t + 65);
    
    subplot(3, 2, i);
    plot(t, x_t);
    title(['f0 = ', num2str(f0), ' Hz']);
    xlabel('Χρόνος (s)');
    ylabel('Α');
end


%B2

% Συχνότητες f0 από 100 Hz έως 475 Hz με βήμα 125 Hz
f0_values = 7525:125:7900;

figure;
for i = 1:length(f0_values)
    f0 = f0_values(i);
    t = 0:1/fs:0.01; % Διάρκεια 0.01 δευτερολέπτου
    x_t = sin(2*pi*f0*t + 65);
    
    subplot(3, 2, i);
    plot(t, x_t);
    title(['f0 = ', num2str(f0), ' Hz']);
    xlabel('Χρόνος (s)');
    ylabel('Α');
end