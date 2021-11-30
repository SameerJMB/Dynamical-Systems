% Logistic Map Bifurcation Diagram
% Sameer Bijwadia
% PHYS 304 Mechanics - Professor Abram

% This script plots a bifurcation diagram (r vs. x) for the logistic map,
% representing the function x_(n+1)=rx_n(1-x_n). End behavior of the
% sequence is plotted for various values of r and starting input x_0. 

clc;
close all;
clear;
%% Set Parameters
% Define range of parameter r
min_r = 1;
delta_r = 0.001; % Resolution
max_r = 4;

values = 200; %Plot last ____ values. 

iterations = 400; % Number of sequence elements calculated (last "values" are plotted)

%% Create Bifurcation (DO NOT CHANGE)
% Initiate array of plotted values
plot_values = zeros(((max_r-min_r)/delta_r)*values,2);
plot_values_index = 1;

% Compute and store last "values" of each sequence given by starting
% value x_0 and parameter r
for r = min_r:delta_r:max_r % Iterate through various values of r
    for x_0 = 0.5 % Test 200 values of starting value x_0 b/t 0 and 1
        sequence = zeros(1,iterations); % Initialize sequence for this x_0 and r pairing
        sequence(1) = x_0; % Set first value in sequence
        for n = 2:length(sequence) % Construct sequence for this x_0 and r pairing
            sequence(n) = r *sequence(n-1)*(1-sequence(n-1)); % Apply recursive logistic equation
        end
        for i = (iterations-values+1):1:iterations % Iterate through each sequence's last "values" numbers
            if sequence(i) > 0.01 % Excludes some 0s. 
                % Add to end array
                plot_values(plot_values_index,1)=r; 
                plot_values(plot_values_index,2)=sequence(i);
                plot_values_index=plot_values_index+1;
            end
        end
    end
end

% Plot Figure
title_string = strcat("Logistic Map Bifurcation diagram from r=", string(min_r), " to r=", string(max_r));

figure(1)
hold on;
plot(plot_values(:,1),plot_values(:,2),'.','MarkerSize',2)
axis([min_r max_r 0 1])
set(gca, 'fontsize', 10) % set font size
set(gcf,'color','w'); % set background color to white
set(gca, 'TickLength',[0 0]) % no tick marks
xlabel('r', 'FontName', 'Calibri','fontsize',14) % x-axis label
ylabel('x', 'FontName', 'Calibri','fontsize',14) % y-axis Label
title(title_string)
grid on; % grid shows