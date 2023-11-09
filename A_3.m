% Define the transfer function G2(s)
T1 = 12.5;  % Time constant

G2 = 1 / (T1 * s + 1);

% Obtain the step response
t = 0:0.01:50;  % Define a time vector for the step response
step_response = step(G2, t);

% Find the time when the step response reaches 63.2% (one time constant)
t63 = T1 * log(1.0 - 0.6321);

% Plot the step response
plot(t, step_response);
grid on;
title('Step Response of G2(s)');
xlabel('Time (seconds)');
ylabel('Amplitude');

% Show a dot and label at the 63.2% point
hold on;
plot(t63, 0.6321, 'ro');  % Place a red dot at the 63.2% point
text(t63, 0.6321, sprintf('(%.2f, %.2f)', t63, 0.6321), 'VerticalAlignment', 'bottom');

% Save the figure
saveas(gcf, 'assign_3_step_with_dots.fig');
