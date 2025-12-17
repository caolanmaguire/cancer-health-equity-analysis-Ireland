# =============================================================================
# Script: 01_download_data.R
# Purpose: Download Children in Care Educational Outcomes data from CSO PxStat
# Dataset: Educational Attendance and Attainment of Children in Care 2018-2025
# Source: Central Statistics Office (CSO) Ireland
# =============================================================================

# Load required packages
library(tidyverse)

# Option 1: Install and use csodata package (RECOMMENDED)
# Uncomment the next line if you need to install
# install.packages("csodata")

library(csodata)

# -----------------------------------------------------------------------------
# Download data from CSO PxStat using csodata package
# -----------------------------------------------------------------------------

# List of relevant table codes for Children in Care data
table_codes <- c(
  "EAACC01",  # Characteristics by single year of age
  "EAACC02",  # Placement type
  "EAACC03",  # Characteristics by nationality
  "EAACC04",  # Characteristics by sex
  "EAACC05",  # Early school leavers
  "EAACC06",  # Employment/Education status by year
  "EAACC07",  # Education enrolments by age
  "EAACC08",  # School attendance patterns
  "EAACC09",  # School attainment
  "EAACC10"   # Employment/Education outcomes
)

# Create data directory if it doesn't exist
if (!dir.exists("data")) {
  dir.create("data")
}
if (!dir.exists("data/raw")) {
  dir.create("data/raw")
}

# Function to download a single table
download_cso_table <- function(table_code) {
  cat("Downloading table:", table_code, "\n")
  
  # YOUR LOGIC HERE: Use cso_get_data() to download the table
  # data <- cso_get_data(table_code)
  
  # Save as CSV
  # filename <- paste0("data/raw/", table_code, ".csv")
  # write_csv(data, filename)
  
  # Return the data
  # return(data)
}

# Download all tables
# YOUR LOGIC HERE: Use map() to download all tables
# all_data <- map(table_codes, download_cso_table)
# names(all_data) <- table_codes


# -----------------------------------------------------------------------------
# Option 2: Manual download URLs (if csodata doesn't work)
# -----------------------------------------------------------------------------

# Direct PxStat URLs - you can manually download and place in data/raw/
pxstat_urls <- tribble(
  ~table_code, ~url,
  "EAACC01", "https://data.cso.ie/table/EAACC01",
  "EAACC02", "https://data.cso.ie/table/EAACC02",
  "EAACC03", "https://data.cso.ie/table/EAACC03",
  "EAACC04", "https://data.cso.ie/table/EAACC04",
  "EAACC05", "https://data.cso.ie/table/EAACC05",
  "EAACC06", "https://data.cso.ie/table/EAACC06",
  "EAACC07", "https://data.cso.ie/table/EAACC07",
  "EAACC08", "https://data.cso.ie/table/EAACC08",
  "EAACC09", "https://data.cso.ie/table/EAACC09",
  "EAACC10", "https://data.cso.ie/table/EAACC10"
)

# Save URL reference
write_csv(pxstat_urls, "data/raw/data_source_urls.csv")

# -----------------------------------------------------------------------------
# Option 3: Read manually downloaded files
# -----------------------------------------------------------------------------

# If you manually downloaded CSV/Excel files, read them here
read_manual_data <- function() {
  # YOUR LOGIC HERE: Read CSV files from data/raw/
  # files <- list.files("data/raw", pattern = "EAACC.*\\.csv$", full.names = TRUE)
  # data_list <- map(files, read_csv)
  # names(data_list) <- str_extract(files, "EAACC\\d+")
  # return(data_list)
}

# -----------------------------------------------------------------------------
# Data citation
# -----------------------------------------------------------------------------

cat("\n=============================================================================\n")
cat("DATA CITATION:\n")
cat("Central Statistics Office (2024). Educational Attendance, Attainment\n")
cat("and Other Outcomes of Children in Care, 2018-2025. CSO Statistical Release.\n")
cat("Available at: https://www.cso.ie/en/statistics/education/\n")
cat("educationalattendanceandattainmentofchildrenincare/\n")
cat("=============================================================================\n\n")

# Save this citation to your references.bib file
citation_text <- '@misc{cso_children_care_2024,
  title = {Educational Attendance, Attainment and Other Outcomes of Children in Care, 2018-2025},
  author = {{Central Statistics Office}},
  year = {2024},
  publisher = {Central Statistics Office, Ireland},
  url = {https://www.cso.ie/en/statistics/education/educationalattendanceandattainmentofchildrenincare/},
  note = {Accessed: December 2024}
}'

writeLines(citation_text, "data/raw/citation.bib")

cat("✓ Data download setup complete!\n")
cat("✓ Citation saved to data/raw/citation.bib\n")
cat("\nNext steps:\n")
cat("1. Run this script to download data\n")
cat("2. Check data/raw/ folder for CSV files\n")
cat("3. Run 02_data_cleaning.R to prepare data for analysis\n")
