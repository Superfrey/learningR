data %>% 
  ggplot(aes(x = x_var, y = y_var)) + 
  geom_jitter(aes(colour = factor(group_var))) +
  #geom_line(aes(group = group_var, colour = factor(group_var))) +
  geom_errorbar(aes(ymin = mean.akk - se.k, ymax = mean.akk + se.k, colour = factor(treatment), width = 1.9)) + 
  
  theme_bw() + theme(panel.border = element_blank(), panel.grid.major = element_blank(),
                     panel.grid.minor = element_blank(), axis.line = element_line(colour = "black")) +
  xlab("x_label") +
  ylab(expression("y_label")) +
  labs(colour = "group_var")+
  scale_color_manual(values = c("darkgoldenrod1", "darkorange", "chartreuse2","chartreuse4"))
