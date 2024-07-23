%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                             %
%    DVG_Matrix_realData.m    %
%    January 2024             %
%                             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function DVGM = DVG_Matrix_realData(Dataset,lengthVirus)

    DVGType = Dataset.DVG_type;

    DVGM = zeros(1+length(Dataset.start),lengthVirus);
    DVGM(1,:) = ones(1,lengthVirus);
    for i = 1:length(Dataset.start)
        if DVGType(i) == "deletion" 
            DVGM(i+1,:) = [ones(1,Dataset.start(i)) zeros(1,Dataset.ending(i)-Dataset.start(i)-1) ones(1,lengthVirus-Dataset.ending(i)+1)];
            
        elseif DVGType(i) == "insertion"      %(BP < RI)
            DVGM(i+1,:) = [ones(1,Dataset.start(i)-1) 2.*ones(1,Dataset.ending(i)-Dataset.start(i)+1) ones(1,lengthVirus-Dataset.ending(i))];

        elseif DVGType(i) == "5cb/sb"         %(RI < BP) but (start < ending)       
            DVGM(i+1,:) = [2.*ones(1,Dataset.start(i)) ones(1,Dataset.ending(i)-Dataset.start(i)) zeros(1,lengthVirus-Dataset.ending(i))];
            
        elseif DVGType(i) == "3cb/sb"         %(BP < RI)
            DVGM(i+1,:) = [zeros(1,Dataset.start(i)-1) ones(1,Dataset.ending(i)-Dataset.start(i)) 2.*ones(1,lengthVirus-Dataset.ending(i)+1)];          
        end
    end   
end