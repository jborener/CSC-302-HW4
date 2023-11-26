cars93 <- MASS::Cars93

cars93_baseline <- ggplot(cars93, aes(x = Price, y = Fuel.tank.capacity)) + geom_point(color = "grey60") + 
  scale_x_continuous(
    name = "price (USD)",
    breaks = c(20, 40, 60),
    labels = c("$20,000", "$40,000", "$60,000")
  ) +
  scale_y_continuous(name = "fuel-tank capacity\n(US gallons)") 

cars93_baseline + ggtitle("lm method") + theme(plot.title = element_text(size = 14, color = "#8fe388" )) +
  geom_smooth(se = TRUE, method = "lm", formula = y ~ x, color = "#8fe388")

cars93_baseline + ggtitle("glm method") + theme(plot.title = element_text(size = 14, color = "#fe8d6d" )) + 
  geom_smooth(se = TRUE, method = "glm", formula = y ~ x, color = "#fe8d6d")

cars93_baseline + ggtitle("gam method") + theme(plot.title = element_text(size = 14, color = "#7c6bea" )) +
  geom_smooth(se = TRUE, method = "gam", formula = y ~ x, color = "#7c6bea")

