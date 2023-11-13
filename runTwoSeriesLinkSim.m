%% Function runTwoSeriesLinkSim()
% Parameters
% K - the number of packets in the application message
% p - the probability of failure
% N - the number of simulations to run
%
% Returns: the average numeric result across the total simulations
function result = runTwoSeriesLinkSim(K, p, N)
    simResults = ones(1, N); % a place to store the result of each simulation

    for i = 1:N
        txAttemptCount = 0; % transmission count
        pktSuccessCount = 0; % number of packets that have made it across

        while pktSuccessCount < K
            % Try the first link
            r1 = rand; % gen random num for the first link
            txAttemptCount = txAttemptCount + 1; % count 1st attempt for the first link

            % while packet transmissions is not successful for the first link (r1 < p)
            while r1 < p
                txAttemptCount = txAttemptCount + 1; % count additional attempt for the first link
                r1 = rand; % transmit again, generate new success check value r1
            end

            % If the first link is successful, attempt the second link
            if r1 >= p
                r2 = rand; % gen random num for the second link
                txAttemptCount = txAttemptCount + 1; % count 1st attempt for the second link

                % while packet transmissions is not successful for the second link (r2 < p)
                while r2 < p
                    txAttemptCount = txAttemptCount + 1; % count additional attempt for the second link
                    r2 = rand; % transmit again, generate new success check value r2
                end

                % If the second link is successful, increase success count
                pktSuccessCount = pktSuccessCount + 1;

            % If the second link fails, startover with the first link
            else
                pktSuccessCount = 0; % reset success count
            end
        end

        simResults(i) = txAttemptCount; % record total number of attempted transmissions
                                        % before entire application msg 
                                        % (K successful packets) transmitted
    end

    result = mean(simResults); % calculate the average number of transmissions
end










