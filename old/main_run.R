# =============================================================================
# MAIN RUN FILE - Children in Care Educational Outcomes Analysis
# Purpose: Execute all analysis scripts in order
# Author: Your Name
# Date: December 17, 2024
# =============================================================================

cat("\n")
cat("================================================================================\n")
cat("  CHILDREN IN CARE EDUCATIONAL OUTCOMES ANALYSIS\n")
cat("  Starting full analysis pipeline...\n")
cat("================================================================================\n\n")

# Record start time
start_time <- Sys.time()

# -----------------------------------------------------------------------------
# STEP 1: Download Data
# -----------------------------------------------------------------------------

cat("\n[1/4] DOWNLOADING DATA...\n")
cat("------------------------------------------------------\n")
source("01_download_data.R")
cat("✓ Data download complete!\n")

# -----------------------------------------------------------------------------
# STEP 2: Clean Data
# -----------------------------------------------------------------------------

cat("\n[2/4] CLEANING DATA...\n")
cat("------------------------------------------------------\n")
source("02_data_cleaning.R")
cat("✓ Data cleaning complete!\n")

# -----------------------------------------------------------------------------
# STEP 3: Run Analysis Functions
# -----------------------------------------------------------------------------

cat("\n[3/4] RUNNING ANALYSIS...\n")
cat("------------------------------------------------------\n")
source("03_analysis_functions.R")
cat("✓ Analysis complete!\n")

# -----------------------------------------------------------------------------
# STEP 4: Create Visualizations
# -----------------------------------------------------------------------------

cat("\n[4/4] CREATING VISUALIZATIONS...\n")
cat("------------------------------------------------------\n")
source("04_visualization_functions.R")
cat("✓ Visualizations complete!\n")

# -----------------------------------------------------------------------------
# Summary
# -----------------------------------------------------------------------------

end_time <- Sys.time()
elapsed <- round(difftime(end_time, start_time, units = "mins"), 2)

cat("\n")
cat("================================================================================\n")
cat("  ANALYSIS PIPELINE COMPLETE!\n")
cat("================================================================================\n")
cat("Time elapsed:", elapsed, "minutes\n")
cat("\nOutputs saved to:\n")
cat("  - data/processed/     (cleaned data)\n")
cat("  - outputs/tables/     (analysis results)\n")
cat("  - outputs/figures/    (visualizations)\n")
cat("\n")
cat("Next step: Render final-project.Qmd to create PDF\n")
cat("================================================================================\n\n")

# Optional: List all output files created
cat("Files created:\n")
cat("\nData files:\n")
print(list.files("data/processed"))
cat("\nTables:\n")
print(list.files("outputs/tables"))
cat("\nFigures:\n")
print(list.files("outputs/figures"))