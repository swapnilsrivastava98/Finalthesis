library(dplyr)
library(readxl)
seasonality_mortality_dataset <- read_excel("seasonality_mortality_dataset.xlsx")

View(seasonality_mortality_dataset)     

df <- read_excel("seasonality_mortality_dataset.xlsx")
df$Month <- as.factor(df$Month)
df$Year <- as.factor(df$Year)

quasi_poisson_model_total <- glm(Total ~ `Avg Temp` + `Low Temp` + `High Temp` + `Avg Humidity Percentage` + Month + Year, 
                                   +                                  data = df, 
                                   +                                  family = quasipoisson())
quasi_poisson_model_male <- glm(Male ~ `Avg Temp` + `Low Temp` + `High Temp` + `Avg Humidity Percentage` + Month + Year, 
                                  +                                  data = df, 
                                  +                                  family = quasipoisson())
quasi_poisson_model_female <- glm(Female ~ `Avg Temp` + `Low Temp` + `High Temp` + `Avg Humidity Percentage` + Month + Year, 
                                    +                                  data = df, 
                                    +                                  family = quasipoisson())
summary(quasi_poisson_model_total)
summary(quasi_poisson_model_male)
summary(quasi_poisson_model_female)
