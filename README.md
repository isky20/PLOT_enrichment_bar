This code defines a function create_horizontal_bar_plots that generates horizontal bar plots from a given dataset, organized by category.
The function first splits the dataset based on the 'category' column and reshapes each sub-dataset from wide to long format.
It then uses ggplot2 to create horizontal bar plots, with values displayed on the x-axis and descriptions on the y-axis.
Each plot is saved as an SVG file, with a customized filename that includes the category and sample name.
The function also allows for customizable plot dimensions.

In the example provided, the dataset Breast_n.csv is used, generating SVG files for each category within the dataset.
