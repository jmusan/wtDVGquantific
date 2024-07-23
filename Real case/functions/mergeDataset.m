%%%%%%%%%%%%%%%%%%%%%%%%
%                      %
%    mergeDataset.m    %
%    Jan 2024          %
%                      %
%%%%%%%%%%%%%%%%%%%%%%%%

function sampleDataset_merged = mergeDataset(sampleDataset,BPRI_th)

    sampleDataset_merged = sampleDataset; sampleDataset_merged(2:length(sampleDataset{:,1}),:) = [];
    Positions = 1:1:length(sampleDataset.start); w = 1;
    while ~isempty(Positions)

        cond0 = (sampleDataset.DVG_type(Positions(1)) == sampleDataset.DVG_type(Positions)); %ERRATA CORREGIDA ENERO2024
        cond1 = (abs(sampleDataset.start(Positions(1))-sampleDataset.start(Positions))<BPRI_th);
        cond2 = (abs(sampleDataset.ending(Positions(1))-sampleDataset.ending(Positions))<BPRI_th);
        conditions = logical(cond0.*cond1.*cond2);

        Sample_merged = sampleDataset.sample(Positions(1));
        DVGType_merged = sampleDataset.DVG_type(Positions(1));
        start_merged = round(sum(sampleDataset.start(Positions(conditions)).*sampleDataset.read_counts_virema(conditions))./sum(sampleDataset.read_counts_virema(conditions)));
        ending_merged = round(sum(sampleDataset.ending(Positions(conditions)).*sampleDataset.read_counts_virema(conditions))./sum(sampleDataset.read_counts_virema(conditions)));
        read_counts_virema_merged = sum(sampleDataset.read_counts_virema(Positions(conditions)));

        rowMergedDataset = splitvars(table([Sample_merged DVGType_merged start_merged ending_merged read_counts_virema_merged]));
        sampleDataset_merged(w,:) = rowMergedDataset;
        Positions(conditions) = [];
        w = w+1;

    end
    
end
