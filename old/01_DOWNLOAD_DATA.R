# ============================================================================
# 01_DOWNLOAD_DATA.R
# Project: Educational Outcomes of Children in Care in Ireland
# Purpose: Download all required CSO data tables
# ============================================================================

library(tidyverse)
library(csodata)

# Verify working directory
cat("Working directory:", getwd(), "\n\n")

# ============================================================================
# DOWNLOAD DATA TABLES
# ============================================================================

cat("Downloading CSO Children in Care data tables...\n\n")

# Define table codes
table_codes <- c(
  "EAACC01",  # Educational attendance
  "EAACC02",  # Junior Certificate results
  "EAACC03",  # Leaving Certificate results
  "EAACC04",  # By sex
  "EAACC05",  # Higher education participation
  "EAACC06",  # Employment status
  "EAACC07",  # Care placements details
  "EAACC08",  # Legal status/attendance
  "EAACC09",  # Number of placements
  "EAACC10"   # Time trends
)

# Download each table
for (code in table_codes) {
  cat("Downloading", code, "...")
  
  tryCatch({
    data <- cso_get_data(code)
    write_csv(data, paste0("data/raw/", code, ".csv"))
    cat(" ✓ (", nrow(data), "rows )\n")
  }, error = function(e) {
    cat(" ✗ ERROR:", conditionMessage(e), "\n")
  })
}

cat("\n")

# ============================================================================
# VERIFY DOWNLOADS
# ============================================================================

cat("Files in data/raw/:\n")
downloaded_files <- list.files("data/raw", pattern = "EAACC.*\\.csv")
print(downloaded_files)

cat("\nTotal files downloaded:", length(downloaded_files), "\n")

if (length(downloaded_files) == 10) {
  cat("✓ All 10 tables downloaded successfully!\n")
} else {
  cat("⚠ Some tables may be missing\n")
}

cat("\nNext: Run 02_create_descriptive_plots.R\n")
