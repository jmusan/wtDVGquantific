
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                         %
%   load_sdPositions.m    %
%   April 2023            %
%                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%


function sgPos = load_sgPositions(nameFile)

    name = split(nameFile,'.');

    if name(1) == "HCoVOC43"

        opts = delimitedTextImportOptions("NumVariables", 3); opts.DataLines = [2, Inf]; opts.Delimiter = [",", ";"];
        opts.VariableNames = ["TRS_location", "TRS_sequence", "genome_region"]; opts.VariableTypes = ["string", "categorical", "string"];
        opts.ExtraColumnsRule = "ignore"; opts.EmptyLineRule = "read"; opts = setvaropts(opts, ["TRS_location", "genome_region"], "WhitespaceRule", "preserve");
        opts = setvaropts(opts, ["TRS_location", "TRS_sequence", "genome_region"], "EmptyFieldRule", "auto");
        sgHCoVOC43 = readtable("Data/DVGfinder_output/TRS_location_OC43.csv", opts); clear opts

        sgPos = str2double(split(sgHCoVOC43.TRS_location,"_"));
        
    elseif name(1) == "MHV"

        opts = delimitedTextImportOptions("NumVariables", 3); opts.DataLines = [2, Inf]; opts.Delimiter = [";", "_"];
        opts.VariableNames = ["TRS_start", "TRS_ending", "Var3"]; opts.SelectedVariableNames = ["TRS_start", "TRS_ending"];
        opts.VariableTypes = ["double", "double", "string"]; opts.ExtraColumnsRule = "ignore"; opts.EmptyLineRule = "read"; opts = setvaropts(opts, "Var3", "WhitespaceRule", "preserve");
        opts = setvaropts(opts, "Var3", "EmptyFieldRule", "auto");
        TRSlocMHV = readtable("Data/DVGfinder_output/TRS_location_MHV.csv", opts); clear opts

        sgPos = TRSlocMHV{:,:};
        
    else
        fprintf("No dataset found")
    end
    
end