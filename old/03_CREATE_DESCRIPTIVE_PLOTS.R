# ============================================================================
# 02_CREATE_DESCRIPTIVE_PLOTS.R
# Project: Educational Outcomes of Children in Care in Ireland
# Purpose: Create descriptive statistics and visualizations
# ============================================================================

library(tidyverse)
library(knitr)

# Verify working directory
cat("Working directory:", getwd(), "\n\n")

# ============================================================================
# LOAD DATA
# ============================================================================

cat("Loading data...\n")

sex_data <- read_csv("data/raw/EAACC04.csv", show_col_types = FALSE)
attendance_data <- read_csv("data/raw/EAACC08.csv", show_col_types = FALSE)
placement_data <- read_csv("data/raw/EAACC09.csv", show_col_types = FALSE)

cat("✓ Data loaded\n\n")

# ============================================================================
# 1. OVERALL SUMMARY TABLE
# ============================================================================

cat("Creating summary statistics...\n")

summary_stats <- tibble(
  Characteristic = c(
    "Children currently in care (Jan 2024)",
    "Children who left care since April 2018",
    "Total children in dataset",
    "Males",
    "Females",
    "Male percentage",
    "Female percentage"
  ),
  Value = c(
    "5,257",
    "3,178",
    "8,435",
    "2,712",
    "2,545",
    "52%",
    "48%"
  )
)

print(summary_stats)

# Save as CSV
write_csv(summary_stats, "output/summary_statistics.csv")
cat("✓ Summary table saved to output/summary_statistics.csv\n\n")

# ============================================================================
# 2. SEX DISTRIBUTION
# ============================================================================

cat("Creating sex distribution plot...\n")

# Extract data
sex_summary <- sex_data %>%
  filter(Statistic == "Children in care in January 2024",
         Sex != "Both sexes") %>%
  select(Sex, Count = `January 2024`)

# Create plot
p_sex <- ggplot(sex_summary, aes(x = Sex, y = Count, fill = Sex)) +
  geom_col() +
  geom_text(aes(label = scales::comma(Count)), vjust = -0.5, size = 5) +
  scale_fill_manual(values = c("Male" = "#56B4E9", "Female" = "#E69F00")) +
  labs(
    title = "Children in Care by Sex",
    subtitle = "January 2024",
    x = NULL,
    y = "Number of Children",
    caption = "Source: CSO Ireland, EAACC04"
  ) +
  theme_minimal(base_size = 12) +
  theme(legend.position = "none") +
  scale_y_continuous(labels = scales::comma)

print(p_sex)
ggsave("plots/01_sex_distribution.png", p_sex, width = 8, height = 6, dpi = 300)

cat("✓ Sex distribution plot saved\n\n")

# ============================================================================
# 3. PLACEMENT STABILITY
# ============================================================================

cat("Creating placement stability plot...\n")

# Extract data
placement_summary <- placement_data %>%
  filter(Statistic == "Children in care in January 2024",
         !str_detect(Number.of.Placements, "Total")) %>%
  select(Number.of.Placements, Count = `January 2024`) %>%
  mutate(
    Percentage = round(Count / sum(Count) * 100, 1),
    Label = paste0(scales::comma(Count), "\n(", Percentage, "%)")
  )

# Create plot
p_placement <- ggplot(placement_summary, 
                      aes(x = Number.of.Placements, y = Count)) +
  geom_col(fill = "#E69F00") +
  geom_text(aes(label = scales::comma(Count)), vjust = -0.5, size = 4) +
  labs(
    title = "Placement Stability of Children in Care",
    subtitle = "Number of different care placements experienced",
    x = "Number of Care Placements",
    y = "Number of Children",
    caption = "Source: CSO Ireland, EAACC09"
  ) +
  theme_minimal(base_size = 12) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  scale_y_continuous(labels = scales::comma)

print(p_placement)
ggsave("plots/02_placement_stability.png", p_placement, width = 10, height = 6, dpi = 300)

cat("✓ Placement stability plot saved\n\n")

# ============================================================================
# 4. LEGAL STATUS DISTRIBUTION
# ============================================================================

cat("Creating legal status plot...\n")

# Extract data
legal_status <- attendance_data %>%
  filter(Statistic == "Children in care in January 2024",
         !str_detect(Legal.Status, "Total")) %>%
  select(Legal.Status, Count = `January 2024`) %>%
  arrange(desc(Count)) %>%
  mutate(
    Percentage = round(Count / sum(Count) * 100, 1),
    Label = paste0(scales::comma(Count), " (", Percentage, "%)")
  )

# Create plot
p_legal <- ggplot(legal_status, 
                  aes(x = reorder(Legal.Status, Count), y = Count)) +
  geom_col(fill = "#9b59b6") +
  geom_text(aes(label = scales::comma(Count)), hjust = -0.2, size = 4) +
  coord_flip() +
  labs(
    title = "Children in Care by Legal Status",
    subtitle = "January 2024",
    x = NULL,
    y = "Number of Children",
    caption = "Source: CSO Ireland, EAACC08"
  ) +
  theme_minimal(base_size = 12) +
  scale_y_continuous(labels = scales::comma, expand = expansion(mult = c(0, 0.15)))

print(p_legal)
ggsave("plots/03_legal_status.png", p_legal, width = 10, height = 6, dpi = 300)

cat("✓ Legal status plot saved\n\n")

# ============================================================================
# 5. KEY STATISTICS SUMMARY
# ============================================================================

cat("Calculating key statistics...\n\n")

# Placement stability stats
one_placement <- placement_summary$Count[1]
multiple_placements <- sum(placement_summary$Count[-1])
pct_stable <- round(one_placement / 5257 * 100, 1)

cat("PLACEMENT STABILITY:\n")
cat("• One placement only:", scales::comma(one_placement), 
    "(", pct_stable, "% - most stable)\n")
cat("• Multiple placements:", scales::comma(multiple_placements), 
    "(", 100 - pct_stable, "%)\n\n")

# Legal status
cat("LEGAL STATUS:\n")
cat("• Most common:", legal_status$Legal.Status[1], "-", 
    legal_status$Label[1], "\n\n")

# Gender
cat("GENDER DISTRIBUTION:\n")
cat("• Males:", scales::comma(sex_summary$Count[1]), "(52%)\n")
cat("• Females:", scales::comma(sex_summary$Count[2]), "(48%)\n\n")

# ============================================================================
# SUMMARY
# ============================================================================

cat("✓✓✓ DESCRIPTIVE ANALYSIS COMPLETE ✓✓✓\n\n")
cat("Created files:\n")
cat("• plots/01_sex_distribution.png\n")
cat("• plots/02_placement_stability.png\n")
cat("• plots/03_legal_status.png\n")
cat("• output/summary_statistics.csv\n\n")

cat("Next: Run 03_download_educational_outcomes.R\n")
