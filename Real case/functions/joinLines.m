
%%%%%%%%%%%%%%%%%%%
%                 %
%   joinLines.m   %
%   April 2023    %
%                 %
%%%%%%%%%%%%%%%%%%%

function X_new = joinLines(X,deltaBases)


    B = unique([X(diff(X) <= deltaBases) X(find(diff(X) <= deltaBases)+1)]);
    separatriz = [0 find(diff(B)>deltaBases) length(B)];
    result = X;
    
    for i = 1:(length(separatriz)-1)
        result(ismember(X,B((separatriz(i)+1):(separatriz(i+1))))) = mean(B((separatriz(i)+1):(separatriz(i+1))));
    end
    X_new = unique(round(result));


end