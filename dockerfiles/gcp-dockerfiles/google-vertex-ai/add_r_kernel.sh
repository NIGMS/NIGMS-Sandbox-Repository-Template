#!/bin/Rscript

install.packages(
   c(
     'devtools', 
      'rlang',
      'uuid', 
      'digest', 
      'callr', 
      'tidyverse', 
      'dplyr',
      'formatR', 
      'remotes', 
      'selectr', 
      'caTools', 
      'stringi', 
      'tidyverse', 
      'rlang'
     ),
     repos='http://cran.us.r-project.org' 
     )

 install.packages(
     c(
       'devtools',
       'curl',
       'openssl',
       'git2r',
       'httr',
       'gh',
       'usethis',
       'shiny'
       ),
       repos='http://cran.us.r-project.org' 
       )

devtools::install_github("IRkernel/IRkernel")
IRkernel::installspec(user = FALSE)
