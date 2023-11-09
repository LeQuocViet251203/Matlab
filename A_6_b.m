% Generate the Bode plot of G6(s) for magnitude and phase
figure;

% Bode magnitude plot
subplot(2, 1, 1);
[magnitude, ~, w] = bode(G6s);
magnitude_dB = 20*log10(squeeze(magnitude));
semilogx(w, magnitude_dB, 'b');
grid on;
title('Bode Magnitude Plot of G6(s)');

% Calculate and extract the values from the magnitude plot
[~, idx_TD] = find(magnitude_dB < -3, 1, 'last');
[~, idx_T1] = find(magnitude_dB < -20, 1, 'last');
idx_Kc = find(magnitude_dB == max(magnitude_dB));

% Extract the corresponding frequencies
w_common = w(max([idx_TD, idx_T1, idx_Kc]));

% Convert frequencies to time constants
TD = 1 / w_common; % Differential time constant
T1 = 1 / w_common; % First-order time constant
Kc = 10^(magnitude_dB(idx_Kc) / 20); % Proportional coefficient in linear scale

% Display the values with dots and text annotations on the magnitude plot
hold on;
scatter(w_common, -3, 100, 'ro', 'filled');
text(w_common, -3, sprintf('TD = %.2f', TD), 'HorizontalAlignment', 'left', 'VerticalAlignment', 'bottom');

scatter(w_common, -20, 100, 'ro', 'filled');
text(w_common, -20, sprintf('T1 = %.2f', T1), 'HorizontalAlignment', 'left', 'VerticalAlignment', 'bottom');

scatter(w_common, magnitude_dB(idx_Kc), 100, 'ro', 'filled');
text(w_common, magnitude_dB(idx_Kc), sprintf('Kc = %.2f', Kc), 'HorizontalAlignment', 'left', 'VerticalAlignment', 'bottom');
hold off;

% Bode phase plot
subplot(2, 1, 2);
[~, phase] = bode(G6s);
semilogx(w, squeeze(phase), 'r');
grid on;
title('Bode Phase Plot of G6(s)');

% Display the values with dots and text annotations on the phase plot
hold on;
scatter(w_common, squeeze(phase(max([idx_TD, idx_T1, idx_Kc]))), 100, 'ro', 'filled');
text(w_common, squeeze(phase(max([idx_TD, idx_T1, idx_Kc]))), sprintf('TD = %.2f, T1 = %.2f, Kc = %.2f', TD, T1, Kc), 'HorizontalAlignment', 'left', 'VerticalAlignment', 'bottom');
hold off;

% Save the figure as 'assign_6_bode.fig'
saveas(gcf, 'assign_6_bode.fig');
