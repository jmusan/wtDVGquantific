%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                           %
%   DSdepth_read.m          %
%   March 2023              %
%                           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [base, depth] = DSdepth_read(name)

    opts = delimitedTextImportOptions("NumVariables", 3);
    opts.DataLines = [1, Inf]; opts.Delimiter = "\t"; opts.VariableNames = ["Var1", "x", "d"];
    opts.SelectedVariableNames = ["x", "d"]; opts.VariableTypes = ["string", "double", "double"];
    opts.ExtraColumnsRule = "ignore"; opts.EmptyLineRule = "read"; opts = setvaropts(opts, "Var1", "WhitespaceRule", "preserve");
    opts = setvaropts(opts, "Var1", "EmptyFieldRule", "auto");
    depth_file = readtable(name, opts);
 
    base = depth_file.x;
    depth = depth_file.d;

end