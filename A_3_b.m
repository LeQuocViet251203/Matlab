% Define the transfer function G2(s)
T1 = 12.5;  % Time constant

G2 = 1 / (T1 * s + 1);

% Create a Bode plot
figure;
[h_mag, h_phase] = bode(G2);

% Extract frequency and magnitude values
freq_values = h_mag.XData;
mag_values = h_mag.YData;
phase_values = h_phase.YData;

% Find the corner frequency (−3 dB frequency) on the Bode plot
[gm, pm, wc, wp] = margin(G2);

% Display the corner frequency and its corresponding magnitude and phase values on the plot
corner_freq_index = find(freq_values <= wc, 1, 'last');
corner_freq_mag = mag_values(corner_freq_index);
corner_freq_phase = phase_values(corner_freq_index);

text_x = wc;
text_y_mag = corner_freq_mag;
text_y_phase = corner_freq_phase;

% Show dots and labels for both magnitude and phase
hold on;
plot(text_x, text_y_mag, 'ro');  % Red dot for magnitude
text(text_x, text_y_mag, sprintf('(%.2f, %.2f)', text_x, text_y_mag), 'VerticalAlignment', 'bottom');
plot(text_x, text_y_phase, 'ro');  % Red dot for phase
text(text_x, text_y_phase, sprintf('(%.2f, %.2f)', text_x, text_y_phase), 'VerticalAlignment', 'bottom');

% Save the Bode diagram
saveas(gcf, 'assign_3_bode_with_dots.fig');
