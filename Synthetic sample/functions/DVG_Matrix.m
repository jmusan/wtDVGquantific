%%%%%%%%%%%%%%%%%%%%%%
%                    %
%    DVG_Matrix.m    %
%    March 2023      %
%                    %
%%%%%%%%%%%%%%%%%%%%%%

function DVGM = DVG_Matrix(lengthTuMV,BP,RI,DVGType)

    DVGM = zeros(1+length(BP),lengthTuMV);
    DVGM(1,:) = ones(1,lengthTuMV);
    for i = 1:length(BP)
        if DVGType(i) == "Deletion_forward"   %(BP < RI) 
            DVGM(i+1,:) = [ones(1,BP(i)) zeros(1,RI(i)-BP(i)-1) ones(1,lengthTuMV-RI(i)+1)];
            
        elseif DVGType(i) == "Deletion_reverse"    %(RI < BP) 
            DVGM(i+1,:) = [ones(1,RI(i)) zeros(1,BP(i)-RI(i)-1) ones(1,lengthTuMV-BP(i)+1)];
            
        elseif DVGType(i) == "Insertion_forward"       %(RI < BP)
            DVGM(i+1,:) = [ones(1,RI(i)-1) 2.*ones(1,BP(i)-RI(i)+1) ones(1,lengthTuMV-BP(i))];
            
        elseif DVGType(i) == "Insertion_reverse"      %(BP < RI)
            DVGM(i+1,:) = [ones(1,BP(i)-1) 2.*ones(1,RI(i)-BP(i)+1) ones(1,lengthTuMV-RI(i))];
                        
        elseif DVGType(i) == "5cb/sb"       %(RI < BP)       
            DVGM(i+1,:) = [2.*ones(1,RI(i)) ones(1,BP(i)-RI(i)) zeros(1,lengthTuMV-BP(i))];
            
        elseif DVGType(i) == "3cb/sb"       %(BP < RI)
            DVGM(i+1,:) = [zeros(1,BP(i)-1) ones(1,RI(i)-BP(i)) 2.*ones(1,lengthTuMV-RI(i)+1)];          
        end
    end   
end
