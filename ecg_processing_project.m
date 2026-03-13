clc
clear
close all

Fs = 360;
time = 0:1/Fs:5;

signal1 = sin(2*pi*1.7*time);
signal2 = 0.4*sin(2*pi*2.1*time);

ecg_signal = signal1 + signal2;

noise_component = 0.35*randn(size(time));
noisy_signal = ecg_signal + noise_component;

cutoff = 28;
[b,a] = butter(3,cutoff/(Fs/2),'low');
filtered_signal = filtfilt(b,a,noisy_signal);

window_size = 6;
smooth_signal = movmean(filtered_signal,window_size);

figure

subplot(4,1,1)
plot(time,ecg_signal)
title('Original ECG Signal')

subplot(4,1,2)
plot(time,noisy_signal)
title('ECG with Noise')

subplot(4,1,3)
plot(time,filtered_signal)
title('After Butterworth Filter')

subplot(4,1,4)
plot(time,smooth_signal)
title('After Moving Average Smoothing')