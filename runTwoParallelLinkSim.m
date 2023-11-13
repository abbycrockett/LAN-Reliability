%% Function runTwoParallelLinksSim()
% Parameters
% K - the number of packets in the application message
% p - the probability of failure for each link
% N - the number of simulations to run
%
% Returns: the average numeric result across the total simulations
function result = runTwoParallelLinkSim(K, p, N)
    simResults = ones(1, N); % a place to store the result of each simulation

    for i = 1:N
        txAttemptCount = 0; % transmission count
        pktSuccessCount = 0; % number of packets that have made it across

        while pktSuccessCount < K
            r1 = rand; % gen random number for the first link 
            r2 = rand; % gen random number for the second link

            % see if one link is successful, if it is then the packet
            % transmission was a success :)
            if r1 > p || r2 > p
                pktSuccessCount = pktSuccessCount + 1; % increase success count
            end

            txAttemptCount = txAttemptCount + 1; % count the number of attempted transmissions
        end

        simResults(i) = txAttemptCount; % record total number of attempted transmissions 
                                        % before entire application msg 
                                        % (K successful packets) transmitted
    end

    result = mean(simResults);
end



