### PROJECT DELIVERABLES TIMELINE ###

# Import timelineS package
library(timelineS)

# Build data frame with deliverables and their corresponding dates
project <- data.frame(Deliverables = c("",
                                       "",
                                       "",
                                       "",
                                       "",
                                       "",
                                       "",
                                       "",
                                       ""),
                      Deliverables_Dates = as.Date(c("yyyy-mm-dd",
                                                     "yyyy-mm-dd",
                                                     "yyyy-mm-dd",
                                                     "yyyy-mm-dd",
                                                     "yyyy-mm-dd",
                                                     "yyyy-mm-dd",
                                                     "yyyy-mm-dd",
                                                     "yyyy-mm-dd",
                                                     "yyyy-mm-dd")))

# Build project deliverables timeline
timelineS(project,                           # load the data frame
          main = "",                         # main refers to the timeline title
          xlab = "",                         # xlab refers to the x-axis label
          buffer.days = 35,                  # set the number of buffer days
          scale = "",                        # scale on timeline (e.g. "year", "quarter", "month", "week")
          scale.format = "%",                # scale formate (e.g. "%Y", "%m", "%d")
          label.direction = "downup",        # set the label direction
          label.cex = 0.75)                  # set the scale font size relative to cex

# Add borders to the timeline
box()


# EXAMPLE

library(timelineS)

project <- data.frame(Deliverables = c("Project Start",
                                       "Diagnosis Report",
                                       "Pre-feseability Studies",
                                       "Feseability Studies",
                                       "Project Planning",
                                       "Detailed Project Report",
                                       "Project Network for Implementation",
                                       "Final Report",
                                       "Presentation to Stakeholders"),
                      Deliverables_Dates = as.Date(c("2020-01-01",
                                                     "2020-02-01",
                                                     "2020-02-15",
                                                     "2020-03-15",
                                                     "2020-04-01",
                                                     "2020-05-01",
                                                     "2020-06-01",
                                                     "2020-08-01",
                                                     "2020-08-15")))

timelineS(project,
          main = "Project Deliverables Timeline",
          xlab = "Year 2020",
          buffer.days = 35,
          scale = "month",
          scale.format = "%b",
          label.direction = "downup",
          label.cex = 0.75)
box()
