### CHECK SHEET ###

# Import de grid package
library(grid)

# Build external box
grid.rect(width = 0.5,
               height = unit(9, "inches"),
               x = 0.5)

# Add a title
grid.text("CHECK SHEET",
          x = 0.5,
          y = 0.95,
          just = "top")

# Add basic information about the item to be inspected
grid.text("Item No.:___________________________________ Customer:___________________________________",
          x = 0.28,
          y = 0.875,
          just = "left")
grid.text("Item description:________________________________________________________________________",
          x = 0.28,
          y = 0.825,
          just = "left")

# Build internal box
grid.rect(width = 0.45,
          height = unit(6.8, "inches"),
          x = 0.5,
          y = 0.42)

# Add information about the points to be inspected and the possible answers
grid.text("INSPECTION CHECK POINTS - FILE REVIEW & QUALITY ASSURANCE",
          x = 0.5,
          y = 0.74,
          just = "top")
grid.text("Description                                                     YES               NO               N/A               Comments",
          x = 0.285,
          y = 0.68,
          just = "left")
grid.text("1._________________________\n\n2._________________________\n\n3._________________________\n\n4._________________________\n\n5._________________________\n\n6._________________________\n\n7._________________________\n\n8._________________________\n\n9._________________________\n\n10.________________________",
          x = 0.285,
          y = 0.4,
          just = "left")

# Add information about the inspector
grid.text("INSPECTOR NAME:___________________________ SIGNATURE:___________________________",
          x = 0.5,
          y = 0.1,
          just = "center")