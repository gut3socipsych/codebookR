####libraries 
library(XLConnect)
library(dplyr)
library(psych)

###code book
code_workbook <- loadWorkbook(filename = "code_books_all.xlsx")
getSheets(code_workbook)
code_jun16 <- readWorksheet(object = code_workbook, sheet = "codebook_3")
##coding for factors 
factor_coding_funct <- function(code_cell){
  code_list <- unlist(strsplit(x = code_cell, split = "="))
  code_list <- list(levels = code_list[1], labels = code_list[2])
  code_list$levels <- unlist(strsplit(x = code_list$levels, split = ","))
  code_list$labels <- unlist(strsplit(x = code_list$labels, split = ":"))
  return(code_list)
}
profession_position_code <- factor_coding_funct(code_cell = code_jun16[code_jun16$variable_name=="q1","coding2"])
comm_method_code <- factor_coding_funct(code_cell = code_jun16[code_jun16$variable_name=="q2","coding2"])
motivation_code <- factor_coding_funct(code_cell = code_jun16[code_jun16$variable_name=="q3","coding2"])


