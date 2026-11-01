#install.packages("vcd")
#install.packages("grid") #Used for label adjustments only
library(vcd)
library(grid)

#Margin Table
test_table<- margin.table(HairEyeColor, margin= c(1,2))
test_table

#FourFold
data("UCBAdmissions")
fourfold(UCBAdmissions, mfrow = c(2,3))

dept_A_data <- UCBAdmissions[,,"A"]
fourfold(dept_A_data)

#Mosaic
summary(HairEyeColor)
head(HairEyeColor)


color_set <- matrix(c("maroon", "darkblue", "gold","darkgreen",
                      "brown", "blue", "#FFBF00", "green",
                      "red", "purple", "pink", "limegreen",
                      "yellow", "skyblue","#8E7618", "violet"), 
                    nrow=4, ncol=4, byrow = TRUE)
mosaic(Eye~Hair, data = test_table, 
       main="Eye Color vs. Hair Color",
       gp=gpar(fill=color_set),
       labeling= labeling_border(
         rot_labels= c(left=90, top=90, right=0, bottom=0),#Rotates the labels to help readability
         offset_labels = c(0.25,0,0,0), #Adds a space on the top row to stop overlap
         just_labels=c(top="center"), 
         gp_labels = gpar(fontsize=12)
       ))



