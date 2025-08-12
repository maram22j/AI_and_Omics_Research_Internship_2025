#loading the data

data<-read.csv(file= "C:/Users/maram/OneDrive/Desktop/intital 1/self learning/Bioinformatics/projects/AI_Omics_Internship_2025/raw_data/patient_info1.csv",sep = ";",stringsAsFactors = FALSE)
str(data)
# 1. Check Cholesterol level (using if) 
# Write an If statement to check cholesterol level is greater than 240, 
# if true, it will prints “High Cholesterol”

cholesterol <- 230
if (data$cholesterol>240){
  print("High Cholesterol")
}
# 2. Blood Pressure Status (using if...else)
# Write an if…else statement to check if blood pressure is normal.
# If it’s less than 120, print: “Blood Pressure is normal”
# If false then print: “Blood Pressure is high”
Systolic_bp <- 130
if (data$blood_pressure<120){
  print("Blood Pressure is normal")
}else{
  print("Blood pressure is high")
}
# 3. Automating Data Type Conversion with for loop

# Use patient_info.csv data and its metadata.
# Perform the following steps separately on each dataset (data and metadata).
# Create a copy of the dataset to work on.
copy_data<-data
# Identify all columns that should be converted to factor type.
str(copy_data)
# Store their names in a variable (factor_cols).
factor_cols<-c("gender","diagnosis","smoker")
# Use a for loop to convert all the columns in factor_cols to factor type.
for (col in factor_cols) {
  copy_data[[col]]<-as.factor(copy_data[[col]])
  
}
str(copy_data)
# 4. Converting Factors to Numeric Codes

# Choose one or more factor columns (e.g., smoking_status).
binary_cols<-c("smoker")

# Convert "Yes" to 1 and "No" to 0 using a for loop.
for(col in binary_cols){
  copy_data[[col]]<-ifelse(copy_data[[col]]=="Yes",1,0)
}
# 3. Verification:
#    Compare the original and modified datasets to confirm changes
str(data)
str(copy_data)
