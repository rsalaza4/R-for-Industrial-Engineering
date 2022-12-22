### GANTT CHART ###

# Import plotrix package
library(plotrix)

# Set date format
Ymd.format <- "%/%/%"

# Define tasks, starting times and ending times 
gantt.info <- list(labels =
                     c("",                            # task 1
                       "",                            # task 2
                       "",                            # task 3
                       "",                            # task 4
                       ""),                           # task 5
                   starts = as.POSIXct(strptime(
                     c("//",                          # initial date task #1
                       "//",                          # initial date task #2
                       "//",                          # initial date task #3
                       "//",                          # initial date task #4
                       "//"),                         # initial date task #5
                     format = Ymd.format)),
                   ends = as.POSIXct(strptime(
                     c("//",                          # ending date task #1
                       "//",                          # ending date task #2
                       "//",                          # ending date task #3
                       "//",                          # ending date task #4
                       "//"),                         # ending date task #5
                     format = Ymd.format)))

# Define vertical grids positions
vgridpos <- as.POSIXct(strptime(c(
  "2020/01/01",
  "2020/02/01",
  "2020/03/01",
  "2020/04/01",
  "2020/05/01",
  "2020/06/01",
  "2020/07/01",
  "2020/08/01",
  "2020/09/01",
  "2020/10/01",
  "2020/11/01",
  "2020/12/01"),
  format = Ymd.format))

# Define vertical grids labels
vgridlab <- month.abb

# Build Gantt chart
gantt.chart(gantt.info,
            main = "",                          # type in the Gantt chart title
            priority.legend = FALSE,            # priority.legend refers to the priority legend
            vgridpos = vgridpos,                # vgridps refers to the vertical grid positions
            vgridlab = vgridlab,                # vgridlab refers to the vertical grid labels
            hgrid = TRUE,                       # hgrid refers to the horizontal grids between activities
            half.height = 0.45,                 # half.height refers to the bars height (from 0.1 to 0.5)
            border.col = "black",               # border.col refers to the bars border color
            taskcolors=c("", "", "", "", ""))   # taskcolors refers to the bars colors

# EXAMPLE

library(plotrix)

Ymd.format <- "%Y/%m/%d"

gantt.info <- list(labels =
                     c("Define",
                       "Measure",
                       "Analyze",
                       "Improve",
                       "Control"),
                   starts = as.POSIXct(strptime(
                     c("2020/01/01",
                       "2020/02/01",
                       "2020/04/01",
                       "2020/06/01",
                       "2020/11/01"),
                   format = Ymd.format)),
                   ends = as.POSIXct(strptime(
                     c("2020/01/31",
                       "2020/03/31",
                       "2020/05/31",
                       "2020/10/31",
                       "2020/12/31"),
                   format = Ymd.format)))

vgridpos <- as.POSIXct(strptime(c(
  "2020/01/01",
  "2020/02/01",
  "2020/03/01",
  "2020/04/01",
  "2020/05/01",
  "2020/06/01",
  "2020/07/01",
  "2020/08/01",
  "2020/09/01",
  "2020/10/01",
  "2020/11/01",
  "2020/12/01"),
  format = Ymd.format))

vgridlab <- month.abb

gantt.chart(gantt.info,
            main = "DMAIC Project - Gantt Chart 2020",
            priority.legend = FALSE,
            vgridpos = vgridpos,
            vgridlab = vgridlab,
            hgrid = TRUE,
            half.height = 0.45,
            border.col = "black",
            taskcolors = c("red", "orange", "yellow", "green", "dark green"))
