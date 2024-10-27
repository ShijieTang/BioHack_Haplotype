library(GWASTools)
library(SNPRelate)
library(GENESIS)


# create GDS file from VCF
vcffile <- "./VCF/hlaa.cdx.new.vcf.gz"
gdsfile <- "./GDS/hlaa.cdx.new.vcf.gz.gds"
# skip with GDS file created
snpgdsVCF2GDS(vcffile, gdsfile, verbose=TRUE)


# get initial estimates of kinship using KING
gds <- snpgdsOpen(gdsfile)
# snpset <- snpgdsLDpruning(gds, method="corr", slide.max.bp=10e6, 
#                          ld.threshold=0.1, verbose=TRUE)
# pruned <- unlist(snpset, use.names=FALSE)
# king <- snpgdsIBDKING(gds, snp.id=pruned, verbose=TRUE)
king <- snpgdsIBDKING(gds, verbose=TRUE)
kingMat <- king$kinship
kingMat[is.na(kingMat)] <- 0
dimnames(kingMat) <- list(king$sample.id, king$sample.id)
snpgdsClose(gds)


# pcair
HapMap_geno <- GdsGenotypeReader(filename = gdsfile)
HapMap_genoData <- GenotypeData(HapMap_geno)
# pcs <- pcair(HapMap_genoData, kinobj = kingMat, divobj = kingMat,
#                  snp.include = pruned)
mypcair <- pcair(HapMap_genoData, kinobj = kingMat, divobj = kingMat)
close(HapMap_genoData)
# plot(pcs)


# run PC-Relate
HapMap_geno <- GdsGenotypeReader(filename = gdsfile)
HapMap_genoData <- GenotypeData(HapMap_geno)
HapMap_genoData <- GenotypeBlockIterator(HapMap_genoData)
mypcrel <- pcrelate(HapMap_genoData, pcs = mypcair$vectors[,1,drop=FALSE],
                    training.set = mypcair$unrels,
                    BPPARAM=BiocParallel::SerialParam())
head(mypcrel$kinBwtn)
head(mypcrel$kinSelf)
grm <- pcrelateToMatrix(mypcrel)
dim(grm)
close(HapMap_genoData)


# heatmap
library(pheatmap)
pheatmap(grm, cluster_rows = T, cluster_cols = T, 
         show_rownames = F, show_colnames = F, 
         treeheight_col = 0, border_color = NA,
         main = "Genetic relationship matrix of TNF region")


# save files
save(kingMat, file = "kingMat.hlaa.Rdata")
save(grm, file = "grm.hlaa.RData")

