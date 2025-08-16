% High-Pass Filtering using FIR and IIR in MATLAB
clc; clear; close all;

% Sampling settings
Fs = 1000;               % Sampling frequency (Hz)
t = 0:1/Fs:1;            % Time vector (1 sec)

% Original signal = 50 Hz (low freq) + 300 Hz (high freq)
f1 = 50; f2 = 300;
signal = sin(2*pi*f1*t) + sin(2*pi*f2*t);

% Add noise
noisy_signal = signal + 0.3*randn(size(t));

% -------------------------
% FIR High-Pass Filter
% -------------------------
fc = 200;                           % Cutoff frequency (Hz)
n = 50;                             % Filter order
b_fir = fir1(n, fc/(Fs/2), 'high'); % FIR coefficients
fir_output = filter(b_fir, 1, noisy_signal);

% -------------------------
% IIR High-Pass Filter (Butterworth)
% -------------------------
order = 4;                         % Filter order
[biir, aiir] = butter(order, fc/(Fs/2), 'high');
iir_output = filter(biir, aiir, noisy_signal);

% -------------------------
% Plot Results
% -------------------------
figure;

subplot(4,1,1);
plot(t, noisy_signal, 'k');
title('Original Signal (50 Hz + 300 Hz + noise)');
xlabel('Time (s)'); ylabel('Amplitude');

subplot(4,1,2);
plot(t, fir_output, 'r');
title('FIR High-Pass Filter Output');
xlabel('Time (s)'); ylabel('Amplitude');

subplot(4,1,3);
plot(t, iir_output, 'b');
title('IIR High-Pass Filter Output');
xlabel('Time (s)'); ylabel('Amplitude');

subplot(4,1,4);
plot(t, signal, 'g');
title('Reference Clean Signal (50 Hz + 300 Hz)');
xlabel('Time (s)'); ylabel('Amplitude');
sgtitle('MATLAB Simulation: High-Pass FIR vs IIR Filtering');