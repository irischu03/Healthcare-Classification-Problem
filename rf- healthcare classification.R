# load data
rm(list = ls())
gc()
data=read.csv(file.choose(),header=T)
names(data)
summary(data)

# deal with NA, drop case id
library(VIM)
library(dplyr)
aggr(data,prop=FALSE,numbers=TRUE)
data_first <- na.omit(data)
data_clean <- select(data_first , -c(case_id,patientid,City_Code_Patient))
summary(data_clean)

#creat dummy variables
library('fastDummies')
dataf <- dummy_cols(data_clean, select_columns = c('Hospital_type_code','Hospital_region_code','Ward_Type','Department',
                                                   'Ward_Facility_Code','Type.of.Admission','Severity.of.Illness','Age'))
dataf.2 <- dummy_cols(dataf, select_columns = c('Hospital_type_code','Hospital_region_code','Ward_Type','Department',
                                                'Ward_Facility_Code','Type.of.Admission','Severity.of.Illness','Age'),
                      remove_selected_columns = TRUE)

dataf.2$Stay <- as.factor(dataf.2$Stay)
head(dataf.2)

#drop unnecessary variables
library(caret)
index <- createDataPartition(dataf.2$Stay, p = .80, list = FALSE)
train <- dataf.2[index,]
test <- dataf.2[-index,]
Stay.test=test$Stay
Stay.train=train$Stay
train=select(train,-Stay)
test=select(test,-Stay)
# use random forest 
library(randomForest)
set.seed(1)
names(train) <- make.names(names(train))
rfModel <-randomForest(Stay.train~., data =train,importance=TRUE,mtry=7)
importance(rfModel)
varImpPlot(rfModel)
names(test) <- make.names(names(test))
yhat.rf = predict(rfModel,newdata=test)
table(yhat.rf,Stay.test) 
cmClassTree2 = confusionMatrix(data = as.factor(yhat.rf), reference = as.factor(Stay.test))
cmClassTree2

# parameter tuning - optimize accruacy

train_imp=select(train,Admission_Deposit,Visitors.with.Patient,Available.Extra.Rooms.in.Hospital,Bed.Grade,Hospital_code)
test_imp=select(test,Admission_Deposit,Visitors.with.Patient,Available.Extra.Rooms.in.Hospital,Bed.Grade,Hospital_code)

set.seed(12)
rfModel2 <-randomForest(Stay.train~., data =train_imp,importance=TRUE)
importance(rfModel2)
varImpPlot(rfModel2)
yhat.rf2 = predict(rfModel2,newdata=test_imp)
table(yhat.rf2,Stay.test) 
cmClassTree2 = confusionMatrix(data = as.factor(yhat.rf2), reference = as.factor(Stay.test))
cmClassTree2