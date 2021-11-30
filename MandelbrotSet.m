% Mandelbrot Set
% Sameer Bijwadia
% PHYS 304 Mechanics - Professor Abram

clc;clear;close all;

% This script constructs the Mandelbrot Set. No need to change anything. 

N = 50; % Max Iterations

% Initiate final plotted array
plot_values = [];
plot_values_index = 1;

% Iterate through many points c=x+yi
for x = -2:0.001:2
    for y = -2:0.001:2
        c = x+y*1i; % Define c, the parameter for this iteration
        z = 0; % x0
        for iteration = 1:N % Run x_0=0 through many iterations of Q_c(x)
            z = z.^2 + c;
        end
        if abs(z)<2 % Check if the orbit is bounded, i.e. stays small 
            plot_values(plot_values_index) = c;
            plot_values_index = plot_values_index + 1;
        end
    end
end

% Plot Configuration
title_string = strcat("Mandelbrot Set");

figure(1)
hold on;
plot(plot_values,'.','MarkerSize',2)
set(gca, 'fontsize', 10) % set font size
set(gcf,'color','w'); % set background color to white
set(gca, 'TickLength',[0 0]) % no tick marks
xlabel('Real(c)', 'FontName', 'Calibri','fontsize',14) % x-axis label
ylabel('Imaginary(c)', 'FontName', 'Calibri','fontsize',14) % y-axis Label
title(title_string)
colormap(jet);
grid on; % grid shows