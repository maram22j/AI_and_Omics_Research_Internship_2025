#importing Data:
data1<-read.csv(file = "C:/Users/maram/OneDrive/Desktop/intital 1/self learning/Bioinformatics/projects/AI_Omics_Internship_2025/raw_data/DEGs_Data_1.csv",sep=",",stringsAsFactors = FALSE)
data2<-read.csv(file="C:/Users/maram/OneDrive/Desktop/intital 1/self learning/Bioinformatics/projects/AI_Omics_Internship_2025/raw_data/DEGs_Data_2.csv",sep=",",stringsAsFactors = FALSE)
#list which file to process:
file_to_process<-list(data1,data2)
# Prepare empty list to store results in R 
result_list<-list()
classify_gene<-function(logFC,padj){
  if(logFC>1 & padj<0.05){
    return("upregulated")
  }else if (logFC< -1 & padj<0.05){
    return("Downregulated")
  } else{
    return("Not_Significant")
  }
}
for (file in seq_along(file_to_process)) {
  df<-file_to_process[[file]]
  #adding a new coloumn 'status
  df$status<-mapply(classify_gene,df$logFC,df$padj)
  
  #replace padj values with 1
  df$padj[is.na(df$padj)]<-1
  #print summary count of significant, upregulated, and downregulated genes
  cat("\n Summary for:",file,"\n")
  #use table() for summaries
  print(table(df$status))
  #save results file into results folder
  result_list[[file]]<-df
  output_file<-paste0("processed",file,".csv")
  write.csv(df,output_file,row.names = FALSE)
  cat("Results saved to:", output_file, "\n")
}
result1<-result_list[[1]]
result2<-result_list[[2]]
