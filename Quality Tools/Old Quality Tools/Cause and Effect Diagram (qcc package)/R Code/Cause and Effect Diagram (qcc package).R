### CAUSE-AND-EFFECT DIAGRAM (qcc) ###

# Import the qcc package
library(qcc)

# Create the cause-and-effect diagram
cause.and.effect(cause = list(Measurements = c("", "", ""),
                              Materials    = c("", "", ""),
                              Personnel    = c("", "", ""),
                              Environment  = c("", "", ""),
                              Methods      = c("", "", ""),
                              Machines     = c("", "", "", "")),
                 effect = "",
                 title = "")

# EXAMPLE

library(qcc)
cause.and.effect(cause = list(Measurements = c("Micrometers", "Microscopes", "Inspectors"),
                              Materials    = c("Alloys", "Lubricants", "Suppliers"),
                              Personnel    = c("Shifts", "Supervisors", "Training", "Operators"),
                              Environment  = c("Condensation", "Moisture"),
                              Methods      = c("Brake", "Engager", "Angle"),
                              Machines     = c("Speed", "Lathes", "Bits", "Sockets")),
                 effect = "Surface Flaws",
                 title = "Cause-and-Effect Diagram (qcc package)")
