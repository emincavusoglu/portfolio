# Load necessary libraries
install.packages("factoextra")
install.packages("cluster")
install.packages("dplyr")
install.packages("reshape2")
install.packages("openxlsx")
library(openxlsx)
library(ggplot2)
library(reshape2)
library(dplyr)
library(factoextra)
library(cluster)
library(readr)
library(reshape2)
#Importing the Normalized and Imputed Dataset
imputed_Happiness_1_normalized <- read_csv("Desktop/imputed_Happiness_1_normalized.csv")
#Prepare data for clustering (remove non-numeric columns)
X <- imputed_Happiness_1_normalized[, -(1:2)] 
#Perform K-means clustering
set.seed(123)
kmeans_model <- kmeans(X, centers = 5, nstart = 25)
#Visualize clusters with dendrogram
distance_matrix <- dist(X)
hc <- hclust(distance_matrix)
plot(hc, hang = -1, cex = 0.6)
#Add the Cluster ID
clusterid <- kmeans_model$cluster
imputed_Happiness_1_normalized$Cluster_ID <- clusterid
#Split dataset into separate data frames based on cluster assignments
cluster_data <- split(imputed_Happiness_1_normalized, imputed_Happiness_1_normalized$Cluster_ID)
#Calculate descriptive statistics for each cluster
cluster_statistics <- lapply(cluster_data, function(cluster_df) {
  summarise_all(cluster_df[, -c(1, 2)], list(mean = mean, median = median, sd = sd)) 
})
#Combine cluster centers with descriptive statistics
cluster_centers <- data.frame(Center = 1:5, kmeans_model$centers)
cluster_descriptive_statistics <- do.call(rbind, cluster_statistics)
cluster_countries <- imputed_Happiness_1_normalized %>%
  +     group_by(Cluster_ID) %>%
  +     summarise(Countries = paste(unique(`Country Name`), collapse = ", "))
#Create a barplot 
X$Cluster_ID <- imputed_Happiness_1_normalized$Cluster_ID
cluster_means <- aggregate(. ~ Cluster_ID, data = X, FUN = mean, na.rm = TRUE)
cluster_means_melt <- melt(cluster_means, id.vars = "Cluster_ID")
ggplot(cluster_means_melt, aes(x = variable, y = value, fill = factor(Cluster_ID))) +
   geom_bar(stat = "identity", position = "dodge") +
  labs(x = "Variable", y = "Mean Value", title = "Cluster Profiles") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
#Creating a comparison matrix
turkey <- subset(imputed_Happiness_1_normalized, imputed_Happiness_1_normalized$"Country Name" == "Turkey")
ABC <- turkey[ ,2:13]
names(ABC)[which(names(ABC) == "Country - RegionId")] <- "Cluster_ID" 
comparison_matrix <- rbind(cluster_means, ABC)
#Creating a Box plot for compare
comparison_melted <- melt(comparison_matrix, id.vars = "Cluster_ID")
ggplot(comparison_melted, aes(x = variable, y = value, fill = Cluster_ID)) +
  +     geom_bar(stat = "identity", position = "dodge") +
  +     labs(title = "Comparison of Turkey with all Clusters",
             +          x = "Variable", y = "Value") +
  +     theme_minimal() +
  +     theme(axis.text.x = element_text(angle = 45, hjust = 1))
#Create separate barplot for each variable
create_barplot <- function(data, variable) {
  ggplot(data, aes(x = Cluster_ID, y = !!sym(variable), fill = Cluster_ID)) +
    geom_bar(stat = "identity", position = "dodge") +
    labs(title = paste("Comparison of", variable, "between Turkey and Clusters"),
         x = "Cluster ID", y = variable) +
    theme_minimal()
}

# Create bar plots for each variable
create_barplot <- function(data, variable) {
  ggplot(data, aes(x = Cluster_ID, y = !!sym(variable), fill = Cluster_ID)) +
    geom_bar(stat = "identity", position = "dodge") +
    labs(title = paste("Comparison of", variable, "between Turkey and Clusters"),
         x = "Cluster ID", y = variable) +
    theme_minimal()
}


variable_names <- names(comparison_matrix)[2:ncol(comparison_matrix)] 
for (variable in variable_names) {
  plot <- create_barplot(comparison_matrix, variable)
  print(plot)
}

#Taking the data to excel
XYZ <- imputed_Happiness_1_normalized$`Country Name`
EXCEL <- cbind(XYZ, imputed_Happiness_1_normalized$Cluster_ID)
write.xlsx(EXCEL, "harita.xlsx", rowNames = FALSE)
