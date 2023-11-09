% Define the individual transfer functions
G41s = 2.7;
G42s = tf(1, [3.8, 1]);
G43s = tf(1, [1, 18]);

% Calculate the overall transfer function in series
G4 = G41s * G42s * G43s;

% Create a Bode plot to visualize the system
figure;
[bode_mag, bode_phase, w] = bode(G4);

% Calculate Kp, T1, and τ from the Bode plot
% Note: The calculations are approximated visually based on the Bode plot

% Kp (proportional coefficient) is the gain at the low-frequency end
Kp = bode_mag(1);

% T1 (time constant) is the corner frequency for G42(s)
T1 = 1 / 3.8; % Inverse of the coefficient of s in G42(s)

% τ (time delay) is the phase cross-over frequency for G43(s)
tau = 1 / 18; % Inverse of the coefficient of s in G43(s)

% Add dots to indicate Kp, T1, and τ on the Bode plots
subplot(2, 1, 1); % Magnitude plot
semilogx(w, 20*log10(squeeze(bode_mag)), 'b');
hold on;
plot(0.01, 20 * log10(Kp), 'ro'); % Kp
plot(1 / T1, 20 * log10(Kp), 'ro'); % T1
plot(1 / tau, 20 * log10(Kp), 'ro'); % τ
title('Bode Plot of G4(s) - Magnitude');
xlabel('Frequency (rad/s)');
ylabel('Magnitude (dB)');

subplot(2, 1, 2); % Phase plot
semilogx(w, squeeze(bode_phase), 'b');
hold on;
plot(0.01, 0, 'ro'); % Kp
plot(1 / T1, -90, 'ro'); % T1
plot(1 / tau, -90, 'ro'); % τ
title('Bode Plot of G4(s) - Phase');
xlabel('Frequency (rad/s)');
ylabel('Phase (degrees)');

% Add text annotations near the dots
subplot(2, 1, 1); % Magnitude plot
text(0.01, 20 * log10(Kp), ['Kp = ' num2str(Kp)], 'HorizontalAlignment', 'right');
text(1 / T1, 20 * log10(Kp), ['T1 = ' num2str(T1)], 'HorizontalAlignment', 'right');
text(1 / tau, 20 * log10(Kp), ['τ = ' num2str(tau)], 'HorizontalAlignment', 'right');

subplot(2, 1, 2); % Phase plot
text(0.01, 5, 'Kp', 'HorizontalAlignment', 'right');
text(1 / T1, -95, 'T1', 'HorizontalAlignment', 'right');
text(1 / tau, -95, 'τ', 'HorizontalAlignment', 'right');

% Save the figure as 'assign_4_bode.fig'
saveas(gcf, 'assign_4_bode.fig');
