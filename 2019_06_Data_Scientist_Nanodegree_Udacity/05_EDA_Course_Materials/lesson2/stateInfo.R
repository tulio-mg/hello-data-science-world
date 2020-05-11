getwd()
setwd('C:\Users\Tulio\Documents\Cursos\Udacity\Nanodegree_Data_Scientist\EDA_Course_Materials\lesson2')
setwd('C:/Users/Tulio/Documents/Cursos/Udacity/Nanodegree_Data_Scientist/EDA_Course_Materials/lesson2')

statesInfo <- read.csv('stateData.csv')

stateSubset <- subset(statesInfo, state.region == 1)
head(stateSubset, 2)
dim(stateSubset)


stateSubsetBracket <- statesInfo[statesInfo$state.region == 1,]
head(stateSubsetBracket, 2)
dim(stateSubsetBracket)

stateIlliteracyBad <- statesInfo[statesInfo$illiteracy <= 0.5,]
head(stateIlliteracyBad, 5)

stateGrad <- subset(statesInfo, highSchoolGrad >= 50)
head(stateGrad)







