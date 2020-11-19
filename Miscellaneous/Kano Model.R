### KANO MODEL ###

# Import ggplot2 package
library(ggplot2)

# Define attributes functions
fun.1 <- function(x) x                      # performance attributes
fun.2 <- function(x) 0.1*x^2 + x + 3        # excitement attributes
fun.3 <- function(x) -(0.1*x^2 - x + 3)     # threshold attributes
fun.4 <- function(x) 0                      # indifferent attributes

# Build Kano plot
ggplot(data = data.frame(x = 0), aes(x = x)) +
  
  # Add axes
  geom_vline(xintercept = 0) +
  geom_hline(yintercept = 0) +
  
  # Add attributes functions
  stat_function(aes(colour = "Performance Attributes"), fun = fun.1) +
  stat_function(aes(colour = "Excitement Attributes"), fun = fun.2) +
  stat_function(aes(colour = "Threshold Attributes"), fun = fun.3) +
  stat_function(aes(colour = "Indifferent Attributes"), fun = fun.4) +
  
  # Set plot limits
  xlim(-5,5) +
  ylim(-10,10) + 
  
  # Define theme
  theme_classic() +
  
  # Remove axes text and ticks
  theme(axis.text.x=element_blank(),
        axis.ticks.x=element_blank(),
        axis.text.y=element_blank(),
        axis.ticks.y=element_blank()) +
  
  # Set attributes colors
  scale_color_manual(values = c("Performance Attributes" = "lightblue",
                                "Excitement Attributes" = "green", 
                                "Threshold Attributes" = "red",
                                "Indifferent Attributes" = "darkgrey")) +
  
  # Customize plot legends
  theme(legend.title=element_blank()) +
  theme(legend.position="bottom") +
  
  # Add title, subtitle, and axes titles
  labs(title = "Kano Model",
       subtitle = "for University Services",
       x = "Functionality",
       y = "Satisfaction") +
  
  # Define excitement attributes
  annotate("text", x = 2.5, y = 7, label = "Placement\nLeisure Time\nAccomodation\nStudy Abroad Programs\nResearch Programs", size = 3) +
  
  # Define performance attributes
  annotate("text", x = 4.5, y = 4.5, label = "Scholarships\nCounseling\nInternships\nInternet Acces\nEducational Offer", size = 3) +
 
  # Define threshold attributes
   annotate("text", x = 4.5, y = -2.5, label = "Tutoring\nAdministrative Services\nLibraries\nLaboratories\nTeaching Equipment\nLecture Halls", size = 3)
