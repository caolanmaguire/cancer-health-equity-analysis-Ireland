# ============================================================================
# 00_SETUP.R
# Project: Educational Outcomes of Children in Care in Ireland
# Purpose: Initial setup - install packages and create folder structure
# ============================================================================

# Set working directory (CHANGE THIS TO YOUR PATH!)
setwd("C:/Users/caola/OneDrive/Documents/github/cancer-health-equity-analysis-Ireland")

# Verify working directory
cat("Working directory:", getwd(), "\n\n")

# ============================================================================
# INSTALL PACKAGES (Run once)
# ============================================================================

# List of required packages
required_packages <- c(
  "tidyverse",    # Data manipulation and visualization
  "purrr",        # Functional programming (REQUIRED for project!)
  "csodata",      # CSO Ireland data access
  "knitr",        # Tables and reporting
  "scales",       # Plot scaling
  "patchwork"     # Combining plots
)

# Install missing packages
install_if_missing <- function(packages) {
  new_packages <- packages[!(packages %in% installed.packages()[,"Package"])]
  if(length(new_packages) > 0) {
    cat("Installing:", paste(new_packages, collapse = ", "), "\n")
    install.packages(new_packages, dependencies = TRUE)
  } else {
    cat("✓ All packages already installed\n")
  }
}

install_if_missing(required_packages)

# ============================================================================
# LOAD PACKAGES
# ============================================================================

library(tidyverse)
library(purrr)
library(csodata)
library(knitr)

cat("✓ Packages loaded\n\n")

# ============================================================================
# CREATE FOLDER STRUCTURE
# ============================================================================

folders <- c(
  "data/raw",
  "data/processed",
  "scripts",
  "plots",
  "output"
)

for (folder in folders) {
  dir.create(folder, recursive = TRUE, showWarnings = FALSE)
  cat("✓ Created/verified:", folder, "\n")
}

cat("\n✓ Setup complete!\n")
cat("Next: Run 01_download_data.R\n")
