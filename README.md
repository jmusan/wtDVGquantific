# Quantifying defective and wild-type viruses from high-throughput RNA sequencing
Defective viral genomes (DVGs) are variants of the wild-type (wt) virus that lack the ability to complete an infectious cycle independently. Identifying and characterizing DVGs is crucial for understanding infection prognosis. Quantifying DVGs is challenging due to their inability to sustain themselves, which makes it difficult to distinguish them from the helper virus, especially using high-throughput RNA sequencing. We developed a method to simultaneously estimate the abundances of DVGs and wt genomes within a sample by identifying genomic regions with significant deviations from the expected sequencing depth. Our approach involves reconstructing the depth profile through a linear system of equations, which provides an estimate of the number of wt and DVG genomes of each type.

The main idea is to consider the experimental depth profile of the sample as a weighted aggregate of a number of elementary DVGs (eDVGs, only containing one recombination event). The weights account for the relevance of specific DVGs in the sample. This procedure leads us eventually to establish an empirical mode decomposition of the depth profile function that estimates the spectrum of eDVGs of each type present as a proxy of the actual DVGs and wt content.

# wtDVGquantific
This repository contains the code and data necessary to replicate the results obtained in Muñoz-Sánchez *et al.* (2024). It includes the curation and artifacts removal of the datasets as well as the eDVGs spectrum estimate. The method is illustrated for two different datasets:
* **Sinthetic Dataset**. This data has been create using SDgenerator (<https://github.com/MJmaolu/SDgenerator>) to evaluate the method's performance.  
* **Real Case**. Real datasets involve much care in the curation and artifact removal steps. Here, we used data from Hillung *et al.* (2024) to estimate the DVG content of a real sample.


For more information, refer to the manuscript freely available at <https://www.biorxiv.org/content/10.1101/2024.07.23.604773v1>.
