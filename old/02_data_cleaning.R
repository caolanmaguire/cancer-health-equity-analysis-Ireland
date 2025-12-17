# =============================================================================
# Script: 02_data_cleaning.R
# Purpose: Clean and prepare Children in Care data for analysis
# =============================================================================

library(tidyverse)

cat("Working directory:", getwd(), "\n\n")
cat("Cleaning and processing data...\n\n")

# =============================================================================
# LOAD RAW DATA
# =============================================================================

# Load all tables
eaacc01 <- read_csv("data/raw/EAACC01.csv", show_col_types = FALSE)
eaacc02 <- read_csv("data/raw/EAACC02.csv", show_col_types = FALSE)
eaacc03 <- read_csv("data/raw/EAACC03.csv", show_col_types = FALSE)
eaacc04 <- read_csv("data/raw/EAACC04.csv", show_col_types = FALSE)
eaacc05 <- read_csv("data/raw/EAACC05.csv", show_col_types = FALSE)
eaacc06 <- read_csv("data/raw/EAACC06.csv", show_col_types = FALSE)
eaacc07 <- read_csv("data/raw/EAACC07.csv", show_col_types = FALSE)
eaacc08 <- read_csv("data/raw/EAACC08.csv", show_col_types = FALSE)
eaacc09 <- read_csv("data/raw/EAACC09.csv", show_col_types = FALSE)
eaacc10 <- read_csv("data/raw/EAACC10.csv", show_col_types = FALSE)

cat("✓ All raw data loaded\n\n")

# =============================================================================
# CLEAN AND STANDARDIZE COLUMN NAMES
# =============================================================================

# Function to clean column names
clean_names <- function(df) {
  df %>%
    rename_with(~str_replace_all(., "\\.", "_")) %>%
    rename_with(tolower)
}

# Clean all datasets using purrr (REQUIRED!)
all_tables <- list(
  eaacc01 = eaacc01,
  eaacc02 = eaacc02,
  eaacc03 = eaacc03,
  eaacc04 = eaacc04,
  eaacc05 = eaacc05,
  eaacc06 = eaacc06,
  eaacc07 = eaacc07,
  eaacc08 = eaacc08,
  eaacc09 = eaacc09,
  eaacc10 = eaacc10
)

# Use map to clean all tables at once (demonstrates purrr usage!)
cleaned_tables <- map(all_tables, clean_names)

cat("✓ Column names standardized using purrr::map\n\n")

# =============================================================================
# CREATE KEY DATASETS FOR ANALYSIS
# =============================================================================

# 1. Demographics summary
demographics <- cleaned_tables$eaacc04 %>%
  filter(statistic == "Children in care in January 2024",
         sex != "Both sexes") %>%
  select(sex, count = january_2024)

# 2. Placement stability
placement_stability <- cleaned_tables$eaacc09 %>%
  filter(statistic == "Children in care in January 2024",
         !str_detect(number_of_placements, "Total")) %>%
  select(number_of_placements, count = january_2024)

# 3. Legal status
legal_status <- cleaned_tables$eaacc08 %>%
  filter(statistic == "Children in care in January 2024",
         !str_detect(legal_status, "Total")) %>%
  select(legal_status, count = january_2024)

cat("✓ Key datasets created\n\n")

# =============================================================================
# SAVE PROCESSED DATA
# =============================================================================

# Create output directory
dir.create("data/processed", recursive = TRUE, showWarnings = FALSE)

# Save key summary datasets
write_csv(demographics, "data/processed/demographics.csv")
write_csv(placement_stability, "data/processed/placement_stability.csv")
write_csv(legal_status, "data/processed/legal_status.csv")

# Save all cleaned tables using purrr::walk2 (demonstrates purrr!)
walk2(cleaned_tables, names(cleaned_tables), function(data, name) {
  write_csv(data, paste0("data/processed/", name, "_clean.csv"))
})

cat("✓ Processed data saved to data/processed/\n\n")

# =============================================================================
# SUMMARY
# =============================================================================

cat("Data cleaning complete!\n")
cat("Key datasets:\n")
cat("• demographics.csv -", nrow(demographics), "rows\n")
cat("• placement_stability.csv -", nrow(placement_stability), "rows\n")
cat("• legal_status.csv -", nrow(legal_status), "rows\n\n")

cat("All cleaned EAACC tables saved with standardized names\n")
