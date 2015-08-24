Read_Current_Month<-function()
{        
#Packages to Add
        library('xlsx')
#Setting Work Database
dir_path<-c("C:/Users/Blake/Desktop/WWTD Processes/Lab Data")
files<-list.files(path=dir_path)
Read_Current_Month<-read.xlsx2(paste(dir_path,files,sep="/"),sheetIndex=1)
return(Read_Current_Month)
}