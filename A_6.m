
G61s = 1 ; 
G62s = tf([27 0], [2.25 1]) ; 
G63s = 3 ; 
G6s = (G61s + G62s) * G63s ;
AD = dcgain(G6s);
% Calculate and plot the step response of G6(s)
% Calculate and plot the step response of G6(s)
% Calculate and plot the step response of G6(s)
step_response = step(G6s);
figure;
plot(step_response);
title('Step Response of G6(s)');
xlabel('Time');
ylabel('Amplitude');

% Calculate step response info
step_info = stepinfo(G6s);

% Extract the values
TD = step_info.RiseTime; % Differential time constant
T1 = step_info.SettlingTime; % First-order time constant
Kc = step_response(end); % Proportional coefficient

% Display the values with dots and labels on the plot
hold on;
plot(TD, Kc, 'ro');
text(TD, Kc, sprintf('TD = %.2f', TD), 'HorizontalAlignment', 'left', 'VerticalAlignment', 'bottom');

plot(T1, Kc, 'ro');
text(T1, Kc, sprintf('T1 = %.2f', T1), 'HorizontalAlignment', 'left', 'VerticalAlignment', 'top');

plot(5, Kc, 'ro');
text(5, Kc, sprintf('Kc = %.2f', Kc), 'HorizontalAlignment', 'left', 'VerticalAlignment', 'bottom');
hold off;

% Save the figure as 'assign_6_step.fig'
saveas(gcf, 'assign_6_step.fig');
