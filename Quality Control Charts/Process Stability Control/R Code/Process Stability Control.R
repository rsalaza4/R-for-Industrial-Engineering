### PROCESS STABILITY CONTROL ###
                                                                                                         
# CONTROL CHART RULES:                                                                                    
                                                                                                       
#   Rule #1: Beyond limits - One or more points beyond the control limits                                       
#   Rule #2: Zone A - 2 out of 3 consecutive points in Zone A or beyond                                       
#   Rule #3: Zone B - 4 out of 5 consecutive points in Zone B or beyond                                         
#   Rule #4: Zone C - 7 or more consecutive points on one side of the average (in Zone C or beyond)             
#   Rule #5: Trend - 7 consecutive points trending up or trending down                                          
#   Rule #6: Mixture - 8 consecutive points with no points in Zone C                                            
#   Rule #7: Stratification - 15 consecutive points in Zone C                                                   
#   Rule #8: Over-control - 14 consecutive points alternating up and down                                           
                                                                                                         
#   Source: SPC for Excel                                                                                 
#   URL: https://www.spcforexcel.com/knowledge/control-chart-basics/control-chart-rules-interpretation    
                                                                                                         
# Import dyplr package
library(dplyr)

# Load CSV file (first column = date, second column = measure)
df <- read.csv(file.choose(), header = FALSE)

# Set column names
colnames(df) <- c("date", "count")

# Set the date column with the date format
df$date <- as.Date(df$date, format = "%m/%d/%Y")

# Create a day column
day <- as.integer(strftime(df$date, format = "%d"))

# Create a week column
week <- as.integer(strftime(df$date, format = "%V"))

# Create a month column
month <- as.integer(strftime(df$date, format = "%m"))

# Create a quarter column
quarter <- quarters(df$date)

# Create a year column
year <- as.integer(strftime(df$date, format = "%Y"))

# Add columns into new data frame
data <- data.frame(df$date, year, quarter, month, week, day, df$count)

# Set column names
colnames(data) <- c("date", "year", "quarter", "month", "week", "day", "count")

# Get center line (avergae)
x_bar <- mean(data$count)

# Get sigma (standard deviation)
sigma <- sd(data$count)

# LCL (Lower Control Limit) Column
LCL <- rep((x_bar - (3*sigma)), length(data$date))

# -2 Sigma Column
lower_two_sigma <- rep((x_bar - (2*sigma)), length(data$date))

# -1 Sigma Column
lower_one_sigma <- rep((x_bar - (1*sigma)), length(data$date))

# +1 Sigma Column
upper_one_sigma <- rep((x_bar + (1*sigma)), length(data$date))

# +2 Sigma Column
upper_two_sigma <- rep((x_bar + (2*sigma)), length(data$date))

# UCL (Upper Control Limit) Column
UCL <- rep((x_bar + (3*sigma)), length(data$date))

# Add control limits columns to data frame
data <- cbind(data, LCL, lower_two_sigma, lower_one_sigma, x_bar, upper_one_sigma, upper_two_sigma, UCL)

# Build control chart
plot(data$count,
     type = "b",
     pch = 16,
     axes = FALSE,
     main = "Control Chart - Example",
     xlab = "Day",
     ylab = "Count",
     xlim = c(0, length(data$date) + 1),
     ylim = c(x_bar - (3.5*sigma), x_bar + (3.5*sigma)))
axis(1,
     at = 1:length(data$date),
     cex.axis = 0.6)
axis(2)
box()
abline(h = x_bar, lwd = 1)
abline(h = UCL, lwd = 1, col = "#7e7e7e", lty = 2)
abline(h = upper_two_sigma, lwd = 1, col = "#7e7e7e", lty = 3)
abline(h = upper_one_sigma, lwd = 1, col = "#7e7e7e", lty = 3)
abline(h = lower_one_sigma, lwd = 1, col = "#7e7e7e", lty = 3)
abline(h = lower_two_sigma, lwd = 1, col = "#7e7e7e", lty = 3)
abline(h = LCL, lwd = 1, col = "#7e7e7e", lty = 2)
text(1, x_bar, "Mean", pos = 2)
text(1, x_bar + (1*sigma), (expression(paste("+1", sigma))), pos = 2)
text(1, x_bar + (2*sigma), (expression(paste("+2", sigma))), pos = 2)
text(1, x_bar + (3*sigma), (expression(paste("+3", sigma))), pos = 2)
text(1, x_bar - (1*sigma), (expression(paste("-1", sigma))), pos = 2)
text(1, x_bar - (2*sigma), (expression(paste("-2", sigma))), pos = 2)
text(1, x_bar - (3*sigma), (expression(paste("-3", sigma))), pos = 2)

# Control chart rules setup
rule1_upper <- TRUE
rule1_lower <- TRUE
rule2_lower <- TRUE
rule2_upper <- TRUE
rule3_lower <- TRUE
rule3_upper <- TRUE
rule4_lower <- TRUE
rule4_upper <- TRUE
rule5_down <- TRUE
rule5_up <- TRUE
rule6 <- TRUE
rule7 <- TRUE
rule8 <- TRUE

# Control chart rules evaluation

# Rule 1 - Lower
R1_LOWER <- c()
i <- 1
for (number in data$count){
  if (number < data$LCL[i]){
    rule1_lower <- FALSE
  }
  R1_LOWER <- append(R1_LOWER, rule1_lower)
  rule1_lower <- TRUE
  i <- i + 1
}

# Rule 1 - Upper
R1_UPPER <- c()
i <- 1
for (number in data$count){
  if (number > data$UCL[i]){
    rule1_upper <- FALSE
  }
  R1_UPPER <- append(R1_UPPER, rule1_upper)
  rule1_upper <- TRUE
  i <- i + 1
}

# Rule 2 - Lower Zone A 
R2_LOWER <- c("-", "-")
i <- 3
while(i <= length(data$count)){
  if((data$count[i] < data$lower_two_sigma[i] & data$count[i-1] < data$lower_two_sigma[i-1])|
     (data$count[i] < data$lower_one_sigma[i] & data$count[i-2] < data$lower_two_sigma[i-2])|
     (data$count[i-1] < data$lower_one_sigma[i-1] & data$count[i-2] < data$lower_two_sigma[i-2])){
    rule2_lower <- FALSE
  }
  R2_LOWER <- append(R2_LOWER, rule2_lower)
  rule2_lower <- TRUE
  i <- i + 1
}

# Rule 2 - Upper Zone A 
R2_UPPER <- c("-", "-")
i <- 3
while(i <= length(data$count)){
  if((data$count[i] > data$upper_two_sigma[i] & data$count[i-1] > data$upper_two_sigma[i-1])|
     (data$count[i] > data$upper_two_sigma[i] & data$count[i-2] > data$upper_two_sigma[i-2])|
     (data$count[i-1] > data$upper_two_sigma[i-1] & data$count[i-2] > data$upper_two_sigma[i-2])){
    rule2_upper <- FALSE
  }
  R2_UPPER <- append(R2_UPPER, rule2_upper)
  rule2_upper <- TRUE
  i <- i + 1
}

# Rule 3 - Lower Zone B 
R3_LOWER <- c("-", "-", "-", "-")
i <- 5
while(i <= length(data$count)){
  if((data$count[i-1] < data$lower_one_sigma[i-1] & data$count[i-2] < data$lower_one_sigma[i-2] & data$count[i-3] < data$lower_one_sigma[i-3] & data$count[i-4] < data$lower_one_sigma[i-4])|
     (data$count[i]   < data$lower_one_sigma[i]   & data$count[i-2] < data$lower_one_sigma[i-2] & data$count[i-3] < data$lower_one_sigma[i-3] & data$count[i-4] < data$lower_one_sigma[i-4])|
     (data$count[i]   < data$lower_one_sigma[i]   & data$count[i-1] < data$lower_one_sigma[i-1] & data$count[i-3] < data$lower_one_sigma[i-3] & data$count[i-4] < data$lower_one_sigma[i-4])|
     (data$count[i]   < data$lower_one_sigma[i]   & data$count[i-1] < data$lower_one_sigma[i-1] & data$count[i-2] < data$lower_one_sigma[i-2] & data$count[i-4] < data$lower_one_sigma[i-4])|
     (data$count[i]   < data$lower_one_sigma[i]   & data$count[i-1] < data$lower_one_sigma[i-1] & data$count[i-2] < data$lower_one_sigma[i-2] & data$count[i-3] < data$lower_one_sigma[i-3])){
    rule3_lower <- FALSE
  }
  R3_LOWER <- append(R3_LOWER, rule3_lower)
  rule3_lower <- TRUE
  i <- i + 1
}

# Rule 3 - Upper Zone B 
R3_UPPER <- c("-", "-", "-", "-")
i <- 5
while(i <= length(data$count)){
  if((data$count[i-1] > data$upper_one_sigma[i-1] & data$count[i-2] > data$upper_one_sigma[i-2] & data$count[i-3] > data$upper_one_sigma[i-3] & data$count[i-4] > data$upper_one_sigma[i-4])|
     (data$count[i]   > data$upper_one_sigma[i]   & data$count[i-2] > data$upper_one_sigma[i-2] & data$count[i-3] > data$upper_one_sigma[i-3] & data$count[i-4] > data$upper_one_sigma[i-4])|
     (data$count[i]   > data$upper_one_sigma[i]   & data$count[i-1] > data$upper_one_sigma[i-1] & data$count[i-3] > data$upper_one_sigma[i-3] & data$count[i-4] > data$upper_one_sigma[i-4])|
     (data$count[i]   > data$upper_one_sigma[i]   & data$count[i-1] > data$upper_one_sigma[i-1] & data$count[i-2] > data$upper_one_sigma[i-2] & data$count[i-4] > data$upper_one_sigma[i-4])|
     (data$count[i]   > data$upper_one_sigma[i]   & data$count[i-1] > data$upper_one_sigma[i-1] & data$count[i-2] > data$upper_one_sigma[i-2] & data$count[i-3] > data$upper_one_sigma[i-3])){
    rule3_lower <- FALSE
  }
  R3_UPPER <- append(R3_UPPER, rule3_upper)
  rule3_upper <- TRUE
  i <- i + 1
}

# Rule 4 - Lower Zone C
R4_LOWER <- c("-", "-", "-", "-", "-", "-")
i <- 7
while (i <= length(data$count)){
  if(data$count[i]   < data$x_bar &
     data$count[i-1] < data$x_bar &
     data$count[i-2] < data$x_bar &
     data$count[i-3] < data$x_bar &
     data$count[i-4] < data$x_bar &
     data$count[i-5] < data$x_bar &
     data$count[i-6] < data$x_bar){
    rule4_lower <- FALSE
  }
  R4_LOWER <- append(R4_LOWER, rule4_lower)
  rule4_lower <- TRUE
  i <- i + 1
}

# Rule 4 - Upper Zone C
R4_UPPER <- c("-", "-", "-", "-", "-", "-")
i <- 7
while (i <= length(data$count)){
  if(data$count[i]   > data$x_bar &
     data$count[i-1] > data$x_bar &
     data$count[i-2] > data$x_bar &
     data$count[i-3] > data$x_bar &
     data$count[i-4] > data$x_bar &
     data$count[i-5] > data$x_bar &
     data$count[i-6] > data$x_bar){
    rule4_lower <- FALSE
  }
  R4_UPPER <- append(R4_UPPER, rule4_upper)
  rule4_upper <- TRUE
  i <- i + 1
}

# Rule 5 - Trend Down
R5_DOWN <- c("-", "-", "-", "-", "-", "-")
i <- 7
while (i <= length(data$count)){
  if (data$count[i]   < data$count[i-1] &
      data$count[i-1] < data$count[i-2] &
      data$count[i-2] < data$count[i-3] &
      data$count[i-3] < data$count[i-4] &
      data$count[i-4] < data$count[i-5] &
      data$count[i-5] < data$count[i-6]){
    rule5_down <- FALSE
  }
  R5_DOWN <- append(R5_DOWN, rule5_down)
  rule5_down <- TRUE
  i <- i + 1
}

# Rule 5 - Trend Up
R5_UP <- c("-", "-", "-", "-", "-", "-")
i <- 7
while (i <= length(data$count)){
  if (data$count[i]   > data$count[i-1] &
      data$count[i-1] > data$count[i-2] &
      data$count[i-2] > data$count[i-3] &
      data$count[i-3] > data$count[i-4] &
      data$count[i-4] > data$count[i-5] &
      data$count[i-5] > data$count[i-6]){
    rule5_up <- FALSE
  }
  R5_UP <- append(R5_UP, rule5_up)
  rule5_up <- TRUE
  i <- i + 1
}

# Rule 6 - Mixture
R6 <- c("-", "-", "-", "-", "-", "-", "-")
i <- 8
while(i <= length(data$count)){
  if((data$count[i]   > data$count[i]   | data$count[i]   < data$count[i])   &
     (data$count[i-1] > data$count[i-1] | data$count[i-1] < data$count[i-1]) &
     (data$count[i-2] > data$count[i-2] | data$count[i-2] < data$count[i-2]) &
     (data$count[i-3] > data$count[i-3] | data$count[i-3] < data$count[i-3]) &
     (data$count[i-4] > data$count[i-4] | data$count[i-4] < data$count[i-4]) &
     (data$count[i-5] > data$count[i-5] | data$count[i-5] < data$count[i-5]) &
     (data$count[i-6] > data$count[i-6] | data$count[i-6] < data$count[i-6]) &
     (data$count[i-7] > data$count[i-7] | data$count[i-7] < data$count[i-7])){
    rule6 <- FALSE
  }
  R6 <- append(R6, rule6)
  rule6 <- TRUE
  i <- i + 1
}

# Rule 7 - Stratification
R7 <- c("-", "-", "-", "-", "-", "-", "-", "-", "-", "-", "-", "-", "-", "-")
i <- 15
while(i <= length(data$count)){
  if (((data$count[i]    > data$x_bar & data$count[i]    < data$upper_one_sigma[i])    | (data$count[i]    < data$x_bar & data$count[i]    > data$lower_one_sigma[i]))    &
      ((data$count[i-1]  > data$x_bar & data$count[i-1]  < data$upper_one_sigma[i-1])  | (data$count[i-1]  < data$x_bar & data$count[i-1]  > data$lower_one_sigma[i-1]))  & 
      ((data$count[i-2]  > data$x_bar & data$count[i-2]  < data$upper_one_sigma[i-2])  | (data$count[i-2]  < data$x_bar & data$count[i-2]  > data$lower_one_sigma[i-2]))  &
      ((data$count[i-3]  > data$x_bar & data$count[i-3]  < data$upper_one_sigma[i-3])  | (data$count[i-3]  < data$x_bar & data$count[i-3]  > data$lower_one_sigma[i-3]))  &
      ((data$count[i-4]  > data$x_bar & data$count[i-4]  < data$upper_one_sigma[i-4])  | (data$count[i-4]  < data$x_bar & data$count[i-4]  > data$lower_one_sigma[i-4]))  &
      ((data$count[i-5]  > data$x_bar & data$count[i-5]  < data$upper_one_sigma[i-5])  | (data$count[i-5]  < data$x_bar & data$count[i-5]  > data$lower_one_sigma[i-5]))  &
      ((data$count[i-6]  > data$x_bar & data$count[i-6]  < data$upper_one_sigma[i-6])  | (data$count[i-6]  < data$x_bar & data$count[i-6]  > data$lower_one_sigma[i-6]))  &
      ((data$count[i-7]  > data$x_bar & data$count[i-7]  < data$upper_one_sigma[i-7])  | (data$count[i-7]  < data$x_bar & data$count[i-7]  > data$lower_one_sigma[i-7]))  &
      ((data$count[i-8]  > data$x_bar & data$count[i-8]  < data$upper_one_sigma[i-8])  | (data$count[i-8]  < data$x_bar & data$count[i-8]  > data$lower_one_sigma[i-8]))  &
      ((data$count[i-9]  > data$x_bar & data$count[i-9]  < data$upper_one_sigma[i-9])  | (data$count[i-9]  < data$x_bar & data$count[i-9]  > data$lower_one_sigma[i-9]))  &
      ((data$count[i-10] > data$x_bar & data$count[i-10] < data$upper_one_sigma[i-10]) | (data$count[i-10] < data$x_bar & data$count[i-10] > data$lower_one_sigma[i-10])) &
      ((data$count[i-11] > data$x_bar & data$count[i-11] < data$upper_one_sigma[i-11]) | (data$count[i-11] < data$x_bar & data$count[i-11] > data$lower_one_sigma[i-11])) &
      ((data$count[i-12] > data$x_bar & data$count[i-12] < data$upper_one_sigma[i-12]) | (data$count[i-12] < data$x_bar & data$count[i-12] > data$lower_one_sigma[i-12])) &
      ((data$count[i-13] > data$x_bar & data$count[i-13] < data$upper_one_sigma[i-13]) | (data$count[i-13] < data$x_bar & data$count[i-13] > data$lower_one_sigma[i-13])) &
      ((data$count[i-14] > data$x_bar & data$count[i-14] < data$upper_one_sigma[i-14]) | (data$count[i-14] < data$x_bar & data$count[i-14] > data$lower_one_sigma[i-14]))){
    rule7 <- FALSE
  }
  R7 <- append(R7, rule7)
  rule7 <- TRUE
  i <- i + 1
}

# Rule 8 - Over-control
R8 <- c("-", "-", "-", "-", "-", "-", "-", "-", "-", "-", "-", "-", "-")
i <- 14
while(i <= length(data$count)){
  if ((data$count[i]    > data$count[i-1]  &
       data$count[i-1]  < data$count[i-2]  &
       data$count[i-2]  > data$count[i-3]  &
       data$count[i-3]  < data$count[i-4]  &
       data$count[i-4]  > data$count[i-5]  &
       data$count[i-5]  < data$count[i-6]  &
       data$count[i-6]  > data$count[i-7]  &
       data$count[i-7]  < data$count[i-8]  &
       data$count[i-8]  > data$count[i-9]  &
       data$count[i-9]  < data$count[i-10] &
       data$count[i-10] > data$count[i-11] &
       data$count[i-11] < data$count[i-12] &
       data$count[i-12] > data$count[i-13])|
      (data$count[i]    < data$count[i-1]  &
       data$count[i-1]  > data$count[i-2]  &
       data$count[i-2]  < data$count[i-3]  &
       data$count[i-3]  > data$count[i-4]  &
       data$count[i-4]  < data$count[i-5]  &
       data$count[i-5]  > data$count[i-6]  &
       data$count[i-6]  < data$count[i-7]  &
       data$count[i-7]  > data$count[i-8]  &
       data$count[i-8]  < data$count[i-9]  &
       data$count[i-9]  > data$count[i-10] &
       data$count[i-10] < data$count[i-11] &
       data$count[i-11] > data$count[i-12] &
       data$count[i-12] < data$count[i-13])){
    rule8 <- FALSE
  }
  R8 <- append(R8, rule8)
  rule8 <- TRUE
  i <- i + 1
}

# Create control chart summary data frame
summary <- data.frame(data$date, R1_LOWER, R1_UPPER, R2_LOWER, R2_UPPER, R3_LOWER, R3_UPPER, R4_LOWER, R4_UPPER, R5_DOWN, R5_UP, R6, R7, R8)
summary_sorted_by_date <- dplyr::arrange(summary, desc(data$date))
View(summary_sorted_by_date)
