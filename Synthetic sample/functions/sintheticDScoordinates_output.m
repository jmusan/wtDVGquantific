%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                      %
%   sintheticDScoordinates_output.m    %
%   Nov 2023                           %
%                                      %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [BP, RI, proportion, DVGType, DScomposition] = sintheticDScoordinates_output(name)

    opts = delimitedTextImportOptions("NumVariables", 9);
    opts.DataLines = [2, Inf]; opts.Delimiter = ",";
    opts.VariableNames = ["BP", "RI", "DVG_type", "proportion", "length_dvg", "pili", "Ni", "ni", "basename_files"];
    opts.VariableTypes = ["double", "double", "string", "double", "double", "double", "double", "double", "string"];
    opts.ExtraColumnsRule = "ignore"; opts.EmptyLineRule = "read";
    opts = setvaropts(opts, ["DVG_type", "basename_files"], "WhitespaceRule", "preserve");
    opts = setvaropts(opts, ["DVG_type", "basename_files"], "EmptyFieldRule", "auto");
    DScomposition = readtable(name, opts); clear opts
    
    BP = DScomposition.BP; BP(isnan(BP)) = [];
    RI = DScomposition.RI; RI(isnan(RI)) = [];
    proportion = DScomposition.proportion; DVGType = DScomposition.DVG_type;

    
end