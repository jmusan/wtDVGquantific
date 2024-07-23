%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                               %
%   datasetReading.m            %
%   Dec 2023                    %
%                               %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function sampleDataset = datasetReading(sampleName,numReads_threshold,DVGfinder_output)

    if DVGfinder_output == "ML"

        opts = delimitedTextImportOptions("NumVariables", 8); opts.DataLines = [2, Inf]; opts.Delimiter = ",";
        opts.VariableNames = ["Var1", "ID", "read_counts_virema", "Var4", "sample", "start", "ending", "DVG_type"];
        opts.SelectedVariableNames = ["ID", "read_counts_virema", "sample", "start", "ending", "DVG_type"];
        opts.VariableTypes = ["string", "string", "double", "string", "string", "double", "double", "string"];
        opts.ExtraColumnsRule = "ignore"; opts.EmptyLineRule = "read";
        opts = setvaropts(opts, ["Var1", "ID", "Var4", "sample", "DVG_type"], "WhitespaceRule", "preserve");
        opts = setvaropts(opts, ["Var1", "ID", "Var4", "sample", "DVG_type"], "EmptyFieldRule", "auto");

        mergedSamples = readtable("Data/DVGfinder_output/20230404_JC_DVGs_all_dedup.csv", opts); clear opts
        mergedSamples = [mergedSamples(:,3) mergedSamples(:,6) mergedSamples(:,4) mergedSamples(:,5) mergedSamples(:,2)];
        
    elseif DVGfinder_output == "Metasearch"

        opts = delimitedTextImportOptions("NumVariables", 7); opts.DataLines = [2, Inf]; opts.Delimiter = ",";
        opts.VariableNames = ["ID", "read_counts_virema", "total_read_counts_ditector", "sample", "start", "ending", "DVG_type"];
        opts.VariableTypes = ["string", "double", "double", "string", "double", "double", "string"];
        opts.ExtraColumnsRule = "ignore"; opts.EmptyLineRule = "read";
        opts = setvaropts(opts, ["ID", "sample", "DVG_type"], "WhitespaceRule", "preserve");
        opts = setvaropts(opts, ["ID", "sample", "DVG_type"], "EmptyFieldRule", "auto");

        opts.Delimiter = ";"; mergedSamples = readtable("Data/DVGfinder_output/20231005_JC_DVGs_all_types.csv", opts); clear opts
        mergedSamples = [mergedSamples(:,4) mergedSamples(:,7) mergedSamples(:,5) mergedSamples(:,6) mergedSamples(:,2)];

    else
        fprint("No DVGfinder output available \n")
    end
    
    sampleDataset_complete = mergedSamples(mergedSamples.sample == sampleName,:); sampleDataset = sampleDataset_complete;
    sampleDataset(sampleDataset_complete.read_counts_virema < numReads_threshold,:) = []; 
    
end
