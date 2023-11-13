%PLOT TWO SERIES LINK

K_values = [1, 5, 15, 50, 100];
N = 1000;
p_values = linspace(0, 1, 100);

% FIVE FIGURES: 1, 5, 15, 50, 100
% -----------------------------------------------
% - repeats 5 times because there are 5 figures
for i = 1:5

    % goes in order by K in array
    K = K_values(i);

    % initialize with zeros
    calculated_results = zeros(1, 5);
    sim_results = zeros(1, 5);
    
    % finds the results based on every probability
    for j = 1:99
        p = p_values(j);
        calculated_results(j) = K*(2-p)/((1 - p)^2);
        sim_results(j) = runTwoSeriesLinkSim(K,j./100,N);
    end
    
    figure;
    semilogy(calculated_results, 'r', 'LineWidth', 2);
    % starts new line:
    hold on
    semilogy(sim_results, 'bo', 'LineWidth', 1, 'MarkerFaceColor', 'none');
    xlabel('Probability of failure (p)');
    ylabel('Number of transmissions (log scale)');
    title(sprintf('Two-Series Link: Results for K = %d', K));
    set(gca, 'YScale', 'log');
    legend('Calculated Results', 'Simulated Results');
end

% ALL PLOTS
% -----------------------------------------------

% re-fill with zeros
calculated_results = zeros(1, 5);
sim_results = zeros(1, 5);

%single figure
figure;
hold on

for i = 1:5
    K = K_values(i);
    
    for j = 1:99
        p = p_values(j);
        calculated_results(j) =  K*(2-p)/((1 - p)^2);
        sim_results(j) = runTwoSeriesLinkSim(K,j./100,N);
    end
    
    semilogy(calculated_results, 'r', 'LineWidth', 2);
    semilogy(sim_results, 'bo', 'LineWidth', 1, 'MarkerFaceColor', 'none');
end

xlabel('Probability of failure (p)');
ylabel('Number of transmissions (log scale)');
title('Two-Series Link: Results for K = 1, 5, 15, 50, 100');
set(gca, 'YScale', 'log');
legend('Calculated Results', 'Simulated Results');