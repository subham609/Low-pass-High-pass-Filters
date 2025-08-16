% Low-Pass FIR Filter Example
clc; clear; close all;

% Sampling settings
Fs = 1000;              % Sampling frequency (Hz)
t = 0:1/Fs:1;           % Time vector (1 sec duration)

% Original signal (50 Hz sine wave)
f1 = 50;
signal = sin(2*pi*f1*t);

% Add noise (200 Hz component + random noise)
f2 = 200;
noisy_signal = signal + 0.5*sin(2*pi*f2*t) + 0.2*randn(size(t));

% FIR Low-pass Filter Design (cutoff = 100 Hz)
fc = 100;                           % Cutoff frequency
n = 50;                             % Filter order
b = fir1(n, fc/(Fs/2));             % Filter coefficients
filtered_signal = filter(b,1,noisy_signal);

% Plot results
figure;

subplot(3,1,1);
plot(t, signal, 'b');
title('Original Signal (50 Hz sine)');
xlabel('Time (s)'); ylabel('Amplitude');

subplot(3,1,2);
plot(t, noisy_signal, 'r');
title('Noisy Signal (with 200 Hz + random noise)');
xlabel('Time (s)'); ylabel('Amplitude');

subplot(3,1,3);
plot(t, filtered_signal, 'g');
title('Filtered Signal (Low-pass FIR)');
xlabel('Time (s)'); ylabel('Amplitude');

sgtitle('MATLAB Simulation: FIR Low-Pass Filter');
