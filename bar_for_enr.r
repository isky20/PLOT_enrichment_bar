library(ggplot2)
library(tidyr)

sample <- "Breast"
df <- read.csv("Breast_n.csv")
width_v <-12
height_v <-16
# Split the dataframe based on the 'category' column
combined_list <- split(df, df$category)


# Loop through each sub-dataframe and create horizontal bar plots
for (cat in names(combined_list)) {
  # Get the current sub-dataframe
  sub_df <- combined_list[[cat]]
  
  # Reshape the dataframe from wide to long format
  long_df <- sub_df %>%
    pivot_longer(cols = starts_with("DAve"))
  
  # Create a horizontal bar plot for the reshaped dataframe
  p <- ggplot(long_df, aes(x = value, y = description, fill = name)) +
    geom_bar(stat = "identity", position = "dodge") +
    labs(title = sample, x = "DAve", y = "Description") +
    theme_minimal() +
    scale_fill_brewer(palette = "Set1")  # Optional: change color palette
  
  ggsave(filename = paste(cat,sample,".svg", sep = ""), 
         plot = p, width = width_v, height = height_v, units = "in", dpi = 600, bg = "white")
}


