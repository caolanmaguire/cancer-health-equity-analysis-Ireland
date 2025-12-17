# =============================================================================
# Script: 02_data_cleaning.R
# Purpose: Clean and prepare Children in Care data for analysis
# =============================================================================

library(tidyverse)

# -----------------------------------------------------------------------------
# Load raw data
# -----------------------------------------------------------------------------

load_raw_data <- function() {
  # YOUR LOGIC HERE: Load the downloaded CSV files
  # This function should return a list of data frames
  
  cat("Loading raw data from data/raw/...\n")
  
  # Example structure:
  # data <- list(
  #   characteristics = read_csv("data/raw/EAACC01.csv"),
  #   placement = read_csv("data/raw/EAACC02.csv"),
  #   outcomes = read_csv("data/raw/EAACC06.csv")
  # )
  
  # return(data)
}

# -----------------------------------------------------------------------------
# Data cleaning functions - YOU FILL IN THE LOGIC
# -----------------------------------------------------------------------------

clean_characteristics_data <- function(data) {
  # YOUR LOGIC HERE: Clean the characteristics data
  # - Convert to tibble
  # - Handle missing values
  # - Create factors for categorical variables
  # - Ensure proper data types
  
  cat("Cleaning characteristics data...\n")
  
  # Example structure:
  # cleaned <- data |>
  #   as_tibble() |>
  #   # YOUR CLEANING STEPS
  
  # return(cleaned)
}

clean_placement_data <- function(data) {
  # YOUR LOGIC HERE: Clean placement type data
  # - Create factor for placement types
  # - Handle any missing values
  # - Ensure consistent naming
  
  cat("Cleaning placement data...\n")
  
  # return(cleaned)
}

clean_outcomes_data <- function(data) {
  # YOUR LOGIC HERE: Clean outcomes data
  # - Create factors for outcome categories
  # - Handle years properly
  # - Create any derived variables needed
  
  cat("Cleaning outcomes data...\n")
  
  # return(cleaned)
}

# -----------------------------------------------------------------------------
# Master cleaning function using purrr
# -----------------------------------------------------------------------------

clean_all_data <- function(raw_data_list) {
  # YOUR LOGIC HERE: Use purrr to clean all datasets
  # This demonstrates using map() which is required for the project
  
  cat("Starting data cleaning pipeline...\n\n")
  
  # Example structure using purrr:
  # cleaned_data <- list(
  #   characteristics = clean_characteristics_data(raw_data_list$characteristics),
  #   placement = clean_placement_data(raw_data_list$placement),
  #   outcomes = clean_outcomes_data(raw_data_list$outcomes)
  # )
  
  # Or use map() if you have multiple similar tables:
  # cleaned_data <- map(raw_data_list, ~some_cleaning_function(.x))
  
  # return(cleaned_data)
}

# -----------------------------------------------------------------------------
# Data validation functions
# -----------------------------------------------------------------------------

validate_data <- function(data) {
  # YOUR LOGIC HERE: Check data quality
  # - Check for unexpected missing values
  # - Verify variable types
  # - Check value ranges
  # - Print summary statistics
  
  cat("Validating cleaned data...\n")
  
  # Example checks:
  # cat("Checking for missing values...\n")
  # cat("Checking variable types...\n")
  # cat("Checking value ranges...\n")
}

# -----------------------------------------------------------------------------
# Save cleaned data
# -----------------------------------------------------------------------------

save_cleaned_data <- function(cleaned_data) {
  # YOUR LOGIC HERE: Save cleaned data for analysis
  
  cat("Saving cleaned data...\n")
  
  # Create processed data directory
  if (!dir.exists("data/processed")) {
    dir.create("data/processed")
  }
  
  # Save each dataset
  # walk2(cleaned_data, names(cleaned_data), 
  #       ~write_csv(.x, paste0("data/processed/", .y, "_cleaned.csv")))
  
  cat("✓ Cleaned data saved to data/processed/\n")
}

# -----------------------------------------------------------------------------
# Main execution
# -----------------------------------------------------------------------------

main <- function() {
  cat("\n=============================================================================\n")
  cat("DATA CLEANING PIPELINE\n")
  cat("=============================================================================\n\n")
  
  # 1. Load raw data
  # raw_data <- load_raw_data()
  
  # 2. Clean all data
  # cleaned_data <- clean_all_data(raw_data)
  
  # 3. Validate
  # validate_data(cleaned_data)
  
  # 4. Save
  # save_cleaned_data(cleaned_data)
  
  cat("\n✓ Data cleaning complete!\n")
  cat("\nNext steps:\n")
  cat("1. Check data/processed/ for cleaned files\n")
  cat("2. Run 03_analysis_functions.R for analysis\n")
  cat("3. Use cleaned data in final-project.Qmd\n")
}

# Uncomment to run:
# main()
