Tidy_Data<-function(Raw_Data){  
        # Convert data frame factor 
        Width<-dim(Raw_Data)[2]
        for (i in 1:Width){Raw_Data[[i]]<-as.character(Raw_Data[[i]])}
     
        #Get Labels
        Label_1<-labels(Raw_Data)[2]
        # Dimensions of Excel Sheet
        Length<-dim(Raw_Data)[1]

        Data_Start=6
        label_2<-unlist(c(Label_1[[1]][1:5],"Test","Value"))
        label_3<-unlist(Label_1)
        hold<-data.frame(matrix(0,ncol=7,nrow=0))
        names(hold)<-c("1","2","3","4","5","6","7")
        hold_2<-data.frame(matrix(0,ncol=7,nrow=1))
        names(hold_2)<-c("1","2","3","4","5","6","7")       
        hold_data<-data.frame(matrix(0,ncol=7,nrow=0))
        names(hold_data)<-c("1","2","3","4","5","6","7")
        
        # Read from reach row
        for (i in 1:Length){
                # Read from each Column
                for(j in 6:Width){
                        hold_2[1]<-Raw_Data[[1]][i]
                        hold_2[2]<-Raw_Data[[2]][i]
                        hold_2[3]<-Raw_Data[[3]][i]
                        hold_2[4]<-Raw_Data[[4]][i]
                        hold_2[5]<-Raw_Data[[5]][i] 
                        hold_2[6]<-label_3[j]                             
                        hold_2[7]<-Raw_Data[[j]][i]
                        if(hold_2[7]!=c(""))hold<-rbind(hold,hold_2)
                        hold_2<-data.frame(matrix(0,ncol=7,nrow=1))
                        names(hold_2)<-c("1","2","3","4","5","6","7")  
                }
                
                hold_data<-rbind(hold_data,hold)
                hold<-data.frame(matrix(0,ncol=7,nrow=0))
                names(hold)<-c("1","2","3","4","5","6","7")       
        }

        
        col.names=label_2       

        Tidy_Data<-data.frame(as.character(hold_data[[1]]),as.character(hold_data[[2]]),as.factor(hold_data[[3]]),as.factor(hold_data[[4]]),as.POSIXct(((as.numeric(hold_data[[5]])-1)*60*60*24-19*60*60+1),origin="1900-01-01 00:00.00"),as.factor(hold_data[[6]]),as.numeric(hold_data[[7]]))

        
        names(Tidy_Data)=label_2
        
return(Tidy_Data)
}