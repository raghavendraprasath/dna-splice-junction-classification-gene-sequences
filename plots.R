pdf("C:/Users/adity/Downloads/dna_visualizations.pdf", width = 10, height = 7)

# Install necessary packages (only need to install once)
install.packages(c("ggplot2", "ggpubr", "tidyverse", "ggridges", "ggseqlogo", "ggalluvial"))

# Load required libraries
library(ggplot2)
library(ggpubr)
library(tidyverse)
library(ggridges)
library(ggseqlogo)  # For DNA sequence logos
library(ggalluvial)  # For Sankey-style diagrams

# Load the dataset (Ensure the correct path)
df <- read.csv("C:/Users/adity/Downloads/dna_data.csv", stringsAsFactors = FALSE)

# Check structure
str(df)

# Extract DNA sequences
dna_sequences <- df$sequence

### 📌 1. Nucleotide Frequency Distribution ###
nucleotide_freq <- table(unlist(strsplit(paste(dna_sequences, collapse = ""), "")))

ggplot(as.data.frame(nucleotide_freq), aes(x = Var1, y = Freq, fill = Var1)) +
  geom_bar(stat = "identity") +
  theme_minimal() +
  labs(title = "Nucleotide Frequency in DNA Sequences",
       x = "Nucleotide", y = "Count") +
  theme(legend.position = "none")

### 📌 2. K-mer Analysis (Most Common 2-mers and 3-mers) ###
# Function to extract k-mers
extract_kmers <- function(seq, k) {
  kmers <- sapply(1:(nchar(seq) - k + 1), function(i) substr(seq, i, i + k - 1))
  return(kmers)
}

# Extract 2-mers and 3-mers
kmers_2 <- unlist(lapply(dna_sequences, extract_kmers, k = 2))
kmers_3 <- unlist(lapply(dna_sequences, extract_kmers, k = 3))

# Convert to data frame and get top frequent k-mers
kmers_2_table <- as.data.frame(table(kmers_2)) %>%
  arrange(desc(Freq)) %>%
  head(10)

kmers_3_table <- as.data.frame(table(kmers_3)) %>%
  arrange(desc(Freq)) %>%
  head(20)

# Bar plot for 2-mers
ggplot(kmers_2_table, aes(x = reorder(kmers_2, -Freq), y = Freq, fill = kmers_2)) +
  geom_bar(stat = "identity") +
  theme_minimal() +
  labs(title = "Top 10 Most Common 2-mers",
       x = "2-mer", y = "Count") +
  coord_flip()

# Heatmap for 3-mers
ggplot(kmers_3_table, aes(x = reorder(kmers_3, -Freq), y = Freq, fill = Freq)) +
  geom_tile() +
  scale_fill_gradient(low = "blue", high = "red") +
  theme_minimal() +
  labs(title = "Top 20 Most Common 3-mers",
       x = "3-mer Sequence", y = "Frequency") +
  coord_flip()

### 📌 3. GC Content Distribution ###
calculate_gc_content <- function(seq) {
  gc_count <- sum(str_count(seq, "[GC]"))
  return(gc_count / nchar(seq) * 100)
}

df$gc_content <- sapply(dna_sequences, calculate_gc_content)

ggplot(df, aes(x = gc_content, fill = label)) +
  geom_density(alpha = 0.6) +
  theme_minimal() +
  labs(title = "GC Content Density Distribution",
       x = "GC Content (%)", y = "Density") +
  scale_fill_manual(values = c("red", "blue", "green"))

### 📌 4. Sequence Length Variation ###
df$seq_length <- nchar(dna_sequences)

ggplot(df, aes(y = seq_length)) +
  geom_boxplot(fill = "purple", alpha = 0.6) +
  theme_minimal() +
  labs(title = "Sequence Length Variation",
       y = "Sequence Length")

### 📌 5. Sankey Diagram for Nucleotide Transitions (Using ggalluvial) ###
# Function to get bigram transitions (A → T, G → C, etc.)
get_transitions <- function(seq) {
  transitions <- paste0(substr(seq, 1, nchar(seq)-1), "→", substr(seq, 2, nchar(seq)))
  return(transitions)
}

transitions <- unlist(lapply(dna_sequences, get_transitions))
transition_df <- as.data.frame(table(transitions)) %>%
  arrange(desc(Freq)) %>%
  head(10)

# Extract "From" and "To" bases for plotting
transition_df$From <- substr(transition_df$transitions, 1, 1)
transition_df$To <- substr(transition_df$transitions, 4, 4)

# Sankey-style plot using ggalluvial
ggplot(transition_df, aes(axis1 = From, axis2 = To, y = Freq)) +
  geom_alluvium(aes(fill = From)) +
  geom_stratum() +
  geom_text(stat = "stratum", aes(label = after_stat(stratum))) +
  theme_minimal() +
  labs(title = "Nucleotide Transition Flow",
       x = "From Nucleotide", y = "Frequency",
       caption = "Visualizing nucleotide changes in DNA sequences")

### 📌 6. Splice Site Positional Analysis ###
# Extract first and last 10 nucleotides
df$first_10 <- substr(df$sequence, 1, 10)
df$last_10 <- substr(df$sequence, nchar(df$sequence) - 9, nchar(df$sequence))

# Find most common start and end motifs
first_10_table <- as.data.frame(table(df$first_10)) %>%
  arrange(desc(Freq)) %>%
  head(10)

last_10_table <- as.data.frame(table(df$last_10)) %>%
  arrange(desc(Freq)) %>%
  head(10)

# Plot most common splice junction motifs
ggplot(first_10_table, aes(x = reorder(Var1, -Freq), y = Freq, fill = Var1)) +
  geom_bar(stat = "identity") +
  theme_minimal() +
  labs(title = "Top 10 Common Start Motifs",
       x = "Start Sequence", y = "Count") +
  coord_flip()


ggplot(last_10_table, aes(x = reorder(Var1, -Freq), y = Freq, fill = Var1)) +
  geom_bar(stat = "identity") +
  theme_minimal() +
  labs(title = "Top 10 Common End Motifs",
       x = "End Sequence", y = "Count") +
  coord_flip()
