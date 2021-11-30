% Julia Sets
% Sameer Bijwadia
% PHYS 304 Mechanics - Professor Abram

clc;clear;close all;

% This script plots Julia sets using the quadratic map, z_(n+1)=(z_n)^2+c

%% Set Parameters [Changeable]
N = 50; % Set Maximum Number of Iterations
c_real=0.37; % Set Real part of c
c_imag = 0.1; % Set imaginary part of c

%% Create Julia Set [Do not change]
c = c_real+c_imag*1i; % Assemble Parameter c

% Initiate final array that will be plotted
plot_values = zeros(6400,1);
plot_values_index = 1;

% Set Limits of Checked Values
x_min = -1.6;
x_max = 1.6;
y_min = -1.6;
y_max = 1.6;

for x = x_min:0.001:x_max % Real Component
    for y = y_min:0.001:y_max % Imaginary Component
        in_julia_set = false; % Assume the point is in the julia set
        z = x + y*1i; %z0
        j = 1;
        flag = true;
        while (flag)
            if (j == N)
                flag = false;
                if (abs(z)<2)
                    in_julia_set=true;
                end
            else
                z = z.^2+c;
            end
            j = j + 1;
        end
        if in_julia_set
            plot_values(plot_values_index) = x+y*1i;
            plot_values_index = plot_values_index+1;
        end
    end
end

title_string = strcat("Julia Set of c=", string(real(c)), "+",string(imag(c)),"i.");

% Plot Configuration
figure(1)
hold on;
plot(plot_values,'.','MarkerSize',2)
set(gca, 'fontsize', 10) % set font size
set(gcf,'color','w'); % set background color to white
set(gca, 'TickLength',[0 0]) % no tick marks
xlabel('Real(z)', 'FontName', 'Calibri','fontsize',14) % x-axis label
ylabel('Imaginary(z)', 'FontName', 'Calibri','fontsize',14) % y-axis Label
title(title_string)
colormap(jet);
grid on; % grid shows

                
        