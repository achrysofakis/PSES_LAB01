clear all;
close all;
% Askhsh1

% A
% Ορίζουμε τις ακολουθίες x(k) και y(k)
x = [1, 2, 3, 4, 7, 9, 6];
y = [0.5, 0.25, 0.1, 0.4, 0.9, 0.3];

% Υπολογισμός του μήκους των ακολουθιών
M = length(x);
N = length(y);

% Χρησιμοποιηούμε την έτοιμη συνάρτηση conv για τη συνέλιξη(για την
% σύγκριση αργότερα)
result_conv = conv(x, y);

% Υπολογισμός του μήκους του αποτελέσματος
L = M + N - 1;
% Αρχικοποίηση του διανύσματος εξόδου (αποτέλεσμα)
h = zeros(1, L);

% Υπολογισμός της συνέλιξης
for n = 1:L
    h(n) = 0;
    for k = max(1, n - N + 1):min(n, M)
        h(n) = h(n) + x(k) * y(n - k + 1);
    end
end
% Εμφάνιση των αρχικών ακολουθιών x[n] και y[n]
figure;
subplot(2, 2, 1);
stem(x);
title('Ακολουθία x[n]');


subplot(2, 2, 2);
stem(y);
title('Ακολουθία y[n]');


% Εμφάνιση του αποτελέσματος της συνέλιξης h(n)
subplot(2, 2, 3);
stem(h);
title('Αποτέλεσμα Συνέλιξης h(n)');


% Εμφάνιση του αποτελέσματος της συνέλιξης result_conv(n)
subplot(2, 2, 4);
stem(result_conv);
title('Αποτέλεσμα Συνέλιξης result-conv(n)');


% Εμφανίζουμε το αποτέλεσμα της δικής μας υλοποίησης(command window)
disp('Αποτέλεσμα δικής μας υλοποίησης:');
disp(h);

% Εμφανίζουμε το αποτέλεσμα απο την ετοιμη εντολη conv(command window)
disp('Αποτέλεσμα συνέλιξης με conv:');
disp(result_conv);




%B


%Μετασχηματισμός Fourier των ακολουθιών
X = fft(x,L);
Y = fft(y,L);
A=X.*Y;
%Πολλαπλασιαστική συνέλιξη στο πεδίο της συχνότητας
conv_freq = ifft(A);


%Σύγκριση των αποτελεσμάτων και εμφάνιση των γραφημάτων
figure;

subplot(2,2,1); % Πρώτο υποδιάγραμμα: Ακολουθία x[n]
stem(x);
title('Ακολουθία x[n]');

subplot(2,2,2); % Δεύτερο υποδιάγραμμα: Ακολουθία y[n]
stem(y);
title('Ακολουθία y[n]');

subplot(2,2,3); % Τρίτο υποδιάγραμμα: Συνέλιξη στο πεδίο του χρόνου
stem(result_conv);
title('Συνέλιξη x[n] * y[n] (χρόνος)');

subplot(2,2,4); % Τέταρτο υποδιάγραμμα: Πολλαπλασιασμός στο πεδίο της συχνότητας
stem(conv_freq);
title('Πολλαπλασιασμός στο πεδίο της συχνότητας');

% Εμφανίζουμε το Αποτέλεσμα υλοποίησης συνέλιξης στο χρονο(command window)
disp('Αποτέλεσμα υλοποίησης στο χρονο:');
disp(result_conv);

% Εμφανίζουμε το Αποτέλεσμα υλοπoιησης  πολ/σμου στην συχνοτητα(command window)
disp('Αποτέλεσμα υλοπoιησης στην συχνοτητα:');
disp(conv_freq);
