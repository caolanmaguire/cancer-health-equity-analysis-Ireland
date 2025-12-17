# ============================================================================
# 03_DOWNLOAD_EDUCATIONAL_OUTCOMES.R
# Project: Educational Outcomes of Children in Care in Ireland
# Purpose: Download educational outcome tables for gap analysis
# ============================================================================

library(tidyverse)
library(csodata)

# Verify working directory
cat("Working directory:", getwd(), "\n\n")

# ============================================================================
# DOWNLOAD EDUCATIONAL OUTCOME TABLES
# ============================================================================

cat("Downloading educational outcome tables for gap analysis...\n\n")

# Tables needed for gap analysis
outcome_tables <- c(
  "EAACC01",  # Educational attendance
  "EAACC02",  # Junior Certificate
  "EAACC03",  # Leaving Certificate  
  "EAACC05",  # Higher education
  "EAACC06"   # Employment status
)

# Download each table
for (code in outcome_tables) {
  cat("Downloading", code, "...")
  
  tryCatch({
    data <- cso_get_data(code)
    write_csv(data, paste0("data/raw/", code, ".csv"))
    cat(" ✓ (", nrow(data), "rows )\n")
    
    # Show what's in the table
    cat("  Statistics available:\n")
    unique_stats <- unique(data$Statistic)
    for (stat in head(unique_stats, 5)) {
      cat("    -", stat, "\n")
    }
    cat("\n")
    
  }, error = function(e) {
    cat(" ✗ ERROR:", conditionMessage(e), "\n")
  })
}

# ============================================================================
# VERIFY AND PREVIEW
# ============================================================================

cat("\n✓ Educational outcome tables downloaded\n\n")

cat("Quick preview of what we can analyze:\n")
cat("=====================================\n\n")

# If EAACC03 exists, show Leaving Cert data
if (file.exists("data/raw/EAACC03.csv")) {
  leaving_cert <- read_csv("data/raw/EAACC03.csv", show_col_types = FALSE)
  cat("EAACC03 - Leaving Certificate outcomes:\n")
  print(unique(leaving_cert$Statistic))
  cat("\n")
}

cat("Next: Run 04_gap_analysis.R to compare care vs all children\n")
