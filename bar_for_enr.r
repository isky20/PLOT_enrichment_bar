library(ggplot2)
library(tidyr)

# Function to create horizontal bar plots from a given dataframe
create_horizontal_bar_plots <- function(data, sample_name, width, height) {
  # Split the dataframe based on the 'category' column
  combined_list <- split(data, data$category)
  
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
      labs(title = sample_name, x = "DAve", y = "Description") +
      theme_minimal() +
      scale_fill_brewer(palette = "Set1")  # Optional: change color palette
    
    # Save the plot as an SVG file
    ggsave(filename = paste(cat, sample_name, ".svg", sep = ""), 
           plot = p, width = width, height = height, units = "in", dpi = 600, bg = "white")
  }
}

# Example usage
sample <- "Breast"
df <- read.csv("Breast_n.csv")
width_v <- 12
height_v <- 16

create_horizontal_bar_plots(df, sample, width_v, height_v)

