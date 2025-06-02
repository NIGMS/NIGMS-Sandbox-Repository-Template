#!/bin/Rscript

install.packages(c("dplyr", "pheatmap",
 "ggrepel", "devtools",
 "R.utils", "ggplot2",
 "plotly", "IRdisplay",
 "base64enc", "RColorBrewer",
 "remotes", "patchwork",
 "cowplot", "fastmap" ))
install.packages("BiocManager")
BiocManager::install(c("ComplexHeatmap", "DESeq2",
 "EnhancedVolcano", "edgR", "apeglm", "EnhancedVolcano", "glmGamPoi" ))

devtools::install_github("lusystemsbio/NetAct", dependencies = TRUE, build_vignettes = FALSE)
devtools::install_github("immunogenomics/presto") 
devtools::install_github("IRkernel/IRkernel")
IRkernel::installspec(user = FALSE)
