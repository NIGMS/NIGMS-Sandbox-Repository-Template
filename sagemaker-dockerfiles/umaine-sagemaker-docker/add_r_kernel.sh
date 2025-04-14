#!/bin/Rscript
install.packages(c('devtools','remotes','car'))
install.packages("BiocManager")
if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")

# Set repositories
options(repos = BiocManager::repositories())

# Install Bioconductor packages
BiocManager::install(c(
	"ComplexHeatmap",
	"DESeq2",
	"EnhancedVolcano",
	"edgeR",
	"apeglm",
	"fgsea"
#	"patchwork",
#	"cowplot",
#	"fastmap",
#	"dplyr",
#	"ggplot2",
#	"pheatmap",
#	"apeglm",
#	"ggrepel",
#	"ComplexHeatmap",
#	"RColorBrewer",
#	"plotly",
#	"base64enc",
#	"IRdisplay"
), force = TRUE)

# Install CRAN packages
install.packages(c(
	"dplyr", 
	"pheatmap",
	"ggrepel",
	"R.utils",
	"ggplot2",
	"plotly",
	"IRdisplay",
	"base64enc",
	"remotes",
	"patchwork",
	"cowplot",
	"fastmap"
), dependencies = TRUE)

# Install the remotes package
if (!requireNamespace("remotes", quietly = TRUE)) {
  install.packages("remotes")
}

#R packages to install using devtools
devtools::install_github("lusystemsbio/NetAct", dependencies = TRUE, build_vignettes = FALSE)
devtools::install_github("immunogenomics/presto")

devtools::install_github("IRkernel/IRkernel")
IRkernel::installspec(user = FALSE)
