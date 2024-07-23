%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                               %
%   BPRI2consensus.m            %
%   Jan 2024                    %
%                               %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function new_sampleDataset = BPRI2consensus(sampleDataset,X,deltaBases,minDel)

    %#ok<*NASGU,*NOPRT>
    new_sampleDataset = sampleDataset;
    upX = X+deltaBases; lowX = X-deltaBases;
    for i = 1:length(sampleDataset.DVG_type)
 
        pos_start = find((lowX <= sampleDataset.start(i)).*(upX >= sampleDataset.start(i)));
        pos_ending = find((lowX <= sampleDataset.ending(i)).*(upX >= sampleDataset.ending(i)));

        if isempty(pos_start)
            new_sampleDataset.start(i) = NaN;
        elseif length(pos_start) > 1
            [~,min_pos_start] = min(abs(sampleDataset.start(i)-X(pos_start)));
            new_sampleDataset.start(i) = X(pos_start(min_pos_start));            
        elseif length(pos_start) == 1
            new_sampleDataset.start(i) = X(pos_start);
        end
        
        if isempty(pos_ending)
            new_sampleDataset.ending(i) = NaN;
        elseif length(pos_ending) > 1
            [~,min_pos_ending] = min(abs(sampleDataset.ending(i)-X(pos_ending)));
            new_sampleDataset.ending(i) = X(pos_ending(min_pos_ending));
        elseif length(pos_ending) == 1
            new_sampleDataset.ending(i) = X(pos_ending);
        end          
    end
    
    remove = zeros(length(new_sampleDataset.DVG_type),1);
    for i = 1:length(new_sampleDataset.DVG_type)
        if new_sampleDataset.DVG_type(i) == "deletion"
            if abs(new_sampleDataset.start(i) - new_sampleDataset.ending(i)) < minDel
                remove(i,1) = 1;
            end
        end
    end
    remove = logical(remove);
    new_sampleDataset(remove,:) = [];
    
end