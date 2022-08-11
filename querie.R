#Reto 1

MyDataBase <- dbConnect(
  drv = RMySQL::MySQL(),
  dbname = "shinydemo",
  host = "shiny-demo.csa7qlmguqrf.us-east-1.rds.amazonaws.com",
  username = "guest",
  password = "guest")

# Si no se arrojaron errores por parte de R, vamos a explorar la BDD

dbListTables(MyDataBase)

DataCountry <- dbGetQuery(MyDataBase, "select * from Country")
head(DataCountry)

DataLanguage <- dbGetQuery(MyDataBase, "select * from CountryLanguage
                                        WHERE Language = 'Spanish'")
head(DataLanguage)

ClassesLanguage <- factor(DataLanguage$IsOfficial)

install.packages("ggplot2")
library(ggplot2)

DataLanguage %>%
  ggplot()+
  aes(x = Percentage, y=CountryCode, fill = IsOfficial)+
  geom_bin2d()+
  coord_flip()
