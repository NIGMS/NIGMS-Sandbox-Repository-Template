#!/bin/Rscript
# Install the remotes package
if (!requireNamespace("remotes", quietly = TRUE)) {
  install.packages("remotes")
}

#R packages to install using devtools
devtools::install_github("lusystemsbio/NetAct", dependencies = TRUE, build_vignettes = FALSE)
devtools::install_github("immunogenomics/presto")

install.packages("igraph")
install.packages("leiden")

#R packages to install using remotes
remotes::install_github("satijalab/seurat", "seurat5")
remotes::install_github("satijalab/seurat-data", "seurat5")
remotes::install_github("stuart-lab/signac")
remotes::install_github("satijalab/azimuth")
remotes::install_github("satijalab/seurat-wrappers")
remotes::install_github("bnprks/BPCells/r")
