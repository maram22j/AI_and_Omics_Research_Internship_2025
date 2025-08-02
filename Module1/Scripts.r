#creation of subfolders:

dir.create("raw_data")
dir.create("clean_data")
dir.create("scripts")
dir.create("results")
dir.create("Tasks")
dir.create("plots")
#loading the data

data<-read.csv(file= "C:/Users/maram/OneDrive/Desktop/intital 1/self learning/Bioinformatics/projects/AI_Omics_Internship_2025/raw_data/patient_info1.csv",sep = ";",stringsAsFactors = FALSE)
str(data)
#converting the variables as factor
data$gender<-as.factor(data$gender)
data$diagnosis<-as.factor(data$diagnosis)
data$smoker<-as.factor(data$smoker)
str(data)
#creation of new variable for smoking status as a binary factor
data$smoking_status<-ifelse(data$smoker=="Yes",1,0)
data$smoking_status<-as.factor(data$smoking_status)
write.csv(data,file = "clean_data/patient_info_clean.csv")

