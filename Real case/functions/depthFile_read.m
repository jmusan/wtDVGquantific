%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                           %
%   depthFile_read.m        %
%   March 2023              %
%                           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [base, depth] = depthFile_read(name)

    opts = delimitedTextImportOptions("NumVariables", 3); opts.DataLines = [1, Inf];
    opts.Delimiter = "\t"; opts.VariableNames = ["ATCC", "x", "d"];
    opts.VariableTypes = ["categorical", "double", "double"]; opts.ExtraColumnsRule = "ignore";
    opts.EmptyLineRule = "read"; opts = setvaropts(opts, "ATCC", "EmptyFieldRule", "auto");
    
    depth_file = readtable("Data/"+name, opts);
    clear opts
    
    base = depth_file.x;
    depth = depth_file.d;

end