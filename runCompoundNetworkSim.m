%% Function runCompoundNetworkSim()
% Parameters
% K - the number of packets in the application message
% p - the probability of failure for both single link and parallel links
% N - the number of simulations to run
%
% Returns: the average numeric result across the total simulations
function result = runCompoundNetworkSim(K, p, N)
    simResults = ones(1, N); % a place to store the result of each simulation

    for i = 1:N
        txAttemptCount = 0; % transmission count
        pktSuccessCount = 0; % number of packets that have made it across

        while pktSuccessCount < K

            % Parallel link attempt
            r_parallel_1 = rand;
            r_parallel_2 = rand;
            % check if at least one link in parallel is successful
            if r_parallel_1 > p || r_parallel_2 > p
                pktSuccessCount = pktSuccessCount + 1; % increase success count
            end
            txAttemptCount = txAttemptCount + 1; % count attempts

             % Single link attempt
            r_single = rand;
            if r_single > p
                pktSuccessCount = pktSuccessCount + 1; % increase success count
            end
            txAttemptCount = txAttemptCount + 1; % count attempts
        end

        simResults(i) = txAttemptCount; % record total number of attempted transmissions 
                                        % before entire application msg 
                                        % (K successful packets) transmitted
    end

    result = mean(simResults);
end


