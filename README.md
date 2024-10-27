# BioHack_Haplotype

**Team members:** Hongsheng Lai, Shijie Tang, Xirui Liu, Zhiwen Bian, Hairuo Wang

**Advisor:** Ben Busby

## Project Description GitHub

Google document: https://docs.google.com/document/d/1khYK22Mcprc-Kxlw6h2K9sU7ytjht80P/edit

GitHub: https://github.com/collaborativebioinformatics/Haploblock_Clusters?tab=readme-ov-file

## Project GitHub

https://github.com/ShijieTang/BioHack_Haplotype

## Background

Over recent decades, methods such as linkage mapping and genome-wide association studies (GWAS) have been developed to identify genetic loci associated with traits. GWAS has become a major research endeavor, with millions of participants and the discovery of hundreds of thousands of trait-associated genetic variants. However, GWAS struggles to account for the evolutionary history and interaction between genetic variants. To address this, we are using ancestral recombination graphs (ARGs), which capture shared ancestry through local trees, to improve quantitative trait locus (QTL) mapping. This approach leverages the genealogical structures within genomes to identify genetic variants related to specific traits, especially in cases of allelic heterogeneity or in understudied populations.

## Goal
Teams will select two sections (haploblocks) of chromosome 6 – one including HLA, and one not, as large as possible and not crossed by known recombination hotspots (~50-100 kbp). Teams will compete to generate with the most computationally efficient approach to create a similarity matrix of these two haploblocks for 300 individuals or some representative subpopulation.  Ideally, this approach will take into account both copies of each haploblock.  One example approach may be to take phased data from beagle or shapeit(x) and then feed it into an ancestral calculator such as relate or beagle.  Another may be to use some approximate alignment techniques to generate trees/matrices.  It is up to individual teams to determine how many rare variants they take into account.  

## EGRM Repo
https://github.com/Ephraim-usc/egrm

## Definitions
1. A haplotype is a physical grouping of genomic variants (or polymorphisms) that tend to be inherited together. A specific haplotype typically reflects a unique combination of variants that reside near each other on a chromosome. ref: https://www.genome.gov/genetics-glossary/haplotype
2. VCF file: https://en.wikipedia.org/wiki/Variant_Call_Format
3. GENESIS: https://www.bioconductor.org/packages/release/bioc/html/GENESIS.html
4. KING: https://www.kingrelatedness.com/

## GENESIS Pipeline:
https://www.bioconductor.org/packages/release/bioc/vignettes/GENESIS/inst/doc/assoc_test_seq.html
https://bioconductor.org/packages/devel/bioc/vignettes/GENESIS/inst/doc/assoc_test.html

## Dataset

Data | 1000 Genomes: https://www.internationalgenome.org/data

British in England and Scotland (GBR): https://www.internationalgenome.org/data-portal/population/GBR

Puerto Rican in Puerto Rico (PUR): https://www.internationalgenome.org/data-portal/population/PUR

Chinese Dai in Xishuangbanna, China (CDX): https://www.internationalgenome.org/data-portal/population/CDX

## Reference
https://www.ncbi.nlm.nih.gov/pmc/articles/PMC10716520/pdf/main.pdf

1. Link, V., et al., Tree-based QTL mapping with expected local genetic relatedness matrices. The American Journal of Human Genetics, 2023. 110(12): p. 2077-2091.
2. Gogarten, S.M., et al., Genetic association testing using the GENESIS R/Bioconductor package. Bioinformatics, 2019. 35(24): p. 5346-5348.
3. Conomos M.P., Miller M., & Thornton T. (2015). Robust Inference of Population Structure for Ancestry Prediction and Correction of Stratification in the Presence of Relatedness. Genetic Epidemiology, 39(4), 276-293.


