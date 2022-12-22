### PROCESS CAPABILITY ANALYSIS ###

# Import SixSigma package
library(SixSigma)

# Type in the measures values
measures <- c()

# Specify the target value
target <- as.numeric(readline(prompt = "Type in the target value: "))

# Specify the Lower Specification Limit (LSL)
LSL <- as.numeric(readline(prompt = "Type in the Lower Specification Limit (LSL): "))

# Specify the Upper Specification Limit (USL)
USL <- as.numeric(readline(prompt = "Type in the Upper Specification Limit (USL): "))

# Get the Z (sigma score) of the process
ss.ca.z(measures, LSL = LSL, USL = USL)

# Get the Cp indices of the process
ss.ca.cp(measures, LSL = LSL, USL = USL)

# Get the Cp indices confidence intervals
ss.ca.cp(measures, LSL = LSL, USL = USL, ci = TRUE)

# Get the Cpk indices of the process
ss.ca.cpk(measures, LSL = LSL, USL = USL)

# Get the Cpk indices confidence intervals
ss.ca.cpk(measures, LSL = LSL, USL = USL, ci = TRUE)

# Perform process capability analysis
ss.study.ca(measures,                 
            LSL = LSL,        
            USL = USL,        
            Target = target,   
            alpha = 0.5,      # Type I error
            f.su = "")        # Type in the study title 

# EXAMPLE

library(SixSigma)

measures <- c(755.81, 750.54, 751.05, 749.52, 749.21, 
              748.38, 748.11, 753.07, 749.56, 750.08, 
              747.16, 747.53, 749.22, 746.76, 747.64, 
              750.46, 749.27, 750.33, 750.26, 751.29)

ss.ca.z(measures, LSL = 740, USL = 760)

ss.ca.cp(measures, LSL = 740, USL = 760)
ss.ca.cp(measures, LSL = 740, USL = 760, ci = TRUE)

ss.ca.cpk(measures, LSL = 740, USL = 760)
ss.ca.cpk(measures, LSL = 740, USL = 760, ci = TRUE)

ss.study.ca(measures,
            LSL = 740, 
            USL = 760, 
            Target = 750, 
            alpha = 0.5, 
            f.su = "Winery Project")
