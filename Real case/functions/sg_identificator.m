%%%%%%%%%%%%%%%%%%%%%%%%%%
%                        %
%   sg_identificator.m   %
%   April 2023           %
%                        %
%%%%%%%%%%%%%%%%%%%%%%%%%%


function is_subgenomic = sg_identificator(sgPos,sampleDataset,deltaBases)

    sgPos_expanded = [-deltaBases+sgPos(:,1) deltaBases+sgPos(:,2)];

    sgStart_pos = sgPos_expanded(1,1):1:sgPos_expanded(1,2);
    sgEnd_pos = zeros(length(sgPos_expanded(:,1))-1,1+max(sgPos_expanded(2:end,2)-sgPos_expanded(2:end,1)));
    for i = 1:(length(sgPos_expanded(:,1))-1)
        basesEnding = sgPos_expanded(i+1,1):1:sgPos_expanded(i+1,2);
        sgEnd_pos(i,1:length(basesEnding)) = basesEnding;
    end

    is_sg = false(length(sampleDataset.ending),2);


    for i = 1:length(sampleDataset.ending)
        is_sg(i,1) = ismember(sampleDataset.start(i),sgStart_pos);
        is_sg(i,2) = ismember(sampleDataset.ending(i),sgEnd_pos);
    end
    is_subgenomic = is_sg(:,1).*is_sg(:,2);

end