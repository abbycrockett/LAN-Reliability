%% Function runCustomCompoundNetworkSim()
% Parameters
% K - the number of packets in the application message
% p1, p2 - the probability of failure for the two links in the parallel
%           part of the Compound Network
% p3 - the probability of failure for the single link
% N - the number of simulations to run
%
% Returns: the average numeric result across the total simulations
function result = runCustomCompoundNetworkSim(K, p1, p2, p3, N)
    simResults = ones(1, N); % a place to store the result of each simulation

    for i = 1:N
        txAttemptCount = 0; % transmission count
        pktSuccessCount = 0; % number of packets that have made it across

        while pktSuccessCount < K

            % Parallel link attempt
            r_p1 = rand;
            r_p2 = rand;
            % check if at least one link in parallel is successful
            if r_p1 > p1 || r_p2 > p2
                pktSuccessCount = pktSuccessCount + 1; % increase success count
            end
            txAttemptCount = txAttemptCount + 1; % count attempts

            % Single link attempt
            r_single = rand;
            if r_single > p3
                pktSuccessCount = pktSuccessCount + 1; % increase success count
            end
            txAttemptCount = txAttemptCount + 1; % count attempts
        end

        simResults(i) = txAttemptCount; % record total number of attempted transmissions 
                                        % before the entire application msg 
                                        % (K successful packets) transmitted
    end

    result = mean(simResults);
end


