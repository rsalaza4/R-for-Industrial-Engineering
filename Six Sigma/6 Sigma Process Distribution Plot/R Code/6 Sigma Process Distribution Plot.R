### 6 SIGMA PROCESS DISTRIBUTION PLOT ###

curve(dnorm(x, mean = 10, sd = 1),
      from = 3, 
      to = 17,
      type = "l",
      lwd = 2,
      xlab = "Measure Unit",
      ylab = "Probability Density",
      main = "6σ Process Distribution")
abline(v = 10, lty = 2, col = 'grey')
abline(v = 16, lty = 2, col = 'red')
abline(v = 4, lty = 2, col = 'red')
abline(h = 0)
text(x = 10, y = 0.24, expression(mu == 10), cex = 1, pos = 1)
text(x = 10, y = 0.20, expression(sigma == 1), cex = 1, pos = 1)
text(x = 16, y = 0.22, "USL +6σ", cex = 1, pos = 1)
text(x = 4, y = 0.22, "LSL -6σ", cex = 1, pos = 1)
text(x = 10, y = 0, "99.999998%", cex = 1, pos = 3)
