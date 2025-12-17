# ============================================================================
# 🚀 PROPER START - Children in Care Project
# ALL ISSUES FIXED! Read this carefully.
# ============================================================================

# ============================================================================
# WHAT WAS WRONG AND HOW IT'S FIXED
# ============================================================================

# ❌ ISSUE 1: Using %>% pipe
# ✅ FIXED: Now using |> native pipe everywhere

# ❌ ISSUE 2: Using setwd() with absolute paths
# ✅ FIXED: Only relative paths, no setwd()

# ❌ ISSUE 3: Separate R scripts
# ✅ FIXED: Code goes IN the Qmd file

# ============================================================================
# CORRECT PROJECT STRUCTURE
# ============================================================================

# Your final submission folder should look EXACTLY like this:
#
# children-care-project/
# ├── final-project.Qmd          ← YOUR MAIN FILE (has all code!)
# ├── final-project.pdf           ← Rendered output
# ├── references.bib              ← Citations
# └── data/                       ← Data folder
#     ├── EAACC01.csv
#     ├── EAACC02.csv
#     ├── EAACC03.csv
#     ├── EAACC04.csv
#     ├── EAACC05.csv
#     ├── EAACC06.csv
#     ├── EAACC07.csv
#     ├── EAACC08.csv
#     ├── EAACC09.csv
#     └── EAACC10.csv
#
# Note: plots/ folder will be created automatically by your code

# ============================================================================
# STEP-BY-STEP SETUP
# ============================================================================

cat("\n")
cat("============================================================================\n")
cat("  PROPER PROJECT SETUP - CHILDREN IN CARE ANALYSIS\n")
cat("============================================================================\n\n")

# ----------------------------------------------------------------------------
# STEP 1: Create project folder
# ----------------------------------------------------------------------------

cat("STEP 1: Create your project folder\n")
cat("====================================\n\n")

cat("1. Create a new folder called 'children-care-project'\n")
cat("2. Open RStudio\n")
cat("3. File → New Project → Existing Directory\n")
cat("4. Select your 'children-care-project' folder\n")
cat("5. This sets the working directory automatically!\n\n")

cat("Press ENTER when done...")
readline()

# ----------------------------------------------------------------------------
# STEP 2: Install packages
# ----------------------------------------------------------------------------

cat("\nSTEP 2: Install required packages\n")
cat("===================================\n\n")

required <- c("tidyverse", "purrr", "csodata", "knitr", "scales")

cat("Installing packages...\n")
for (pkg in required) {
  if (!require(pkg, character.only = TRUE, quietly = TRUE)) {
    cat("Installing", pkg, "...\n")
    install.packages(pkg)
  } else {
    cat("✓", pkg, "already installed\n")
  }
}

library(tidyverse)
library(purrr)
library(csodata)

cat("\n✓ All packages ready!\n\n")

# ----------------------------------------------------------------------------
# STEP 3: Download data
# ----------------------------------------------------------------------------

cat("STEP 3: Download CSO data\n")
cat("===========================\n\n")

# Create data folder (relative path!)
dir.create("data", showWarnings = FALSE)

# Download all tables
tables <- c("EAACC01", "EAACC02", "EAACC03", "EAACC04", "EAACC05",
            "EAACC06", "EAACC07", "EAACC08", "EAACC09", "EAACC10")

cat("Downloading 10 data tables...\n")
for (code in tables) {
  cat("  •", code, "...")
  data <- cso_get_data(code)
  write_csv(data, paste0("data/", code, ".csv"))  # Relative path!
  cat(" ✓\n")
}

cat("\n✓ All data downloaded to data/ folder\n\n")

# ----------------------------------------------------------------------------
# STEP 4: Verify structure
# ----------------------------------------------------------------------------

cat("STEP 4: Verify project structure\n")
cat("==================================\n\n")

cat("Your project folder now contains:\n\n")

files <- list.files()
cat("Main directory:\n")
for (f in files) {
  cat("  •", f, "\n")
}

cat("\nData directory:\n")
data_files <- list.files("data")
for (f in data_files) {
  cat("  •", f, "\n")
}

cat("\n")

# ----------------------------------------------------------------------------
# STEP 5: Download project files
# ----------------------------------------------------------------------------

cat("STEP 5: Download project files from Claude\n")
cat("============================================\n\n")

cat("You need to download these files:\n\n")

cat("1. final-project-FIXED.Qmd  → Save as 'final-project.Qmd'\n")
cat("   This has:\n")
cat("   • Native pipe |> (NOT %>%)\n")
cat("   • Relative paths (NOT absolute)\n")
cat("   • All code in Qmd (NOT separate scripts)\n")
cat("   • Your descriptive analysis already coded!\n\n")

cat("2. references.bib → Save in project folder\n")
cat("   Has CSO citation ready\n\n")

# ----------------------------------------------------------------------------
# STEP 6: Test the Qmd
# ----------------------------------------------------------------------------

cat("STEP 6: Test rendering\n")
cat("========================\n\n")

cat("Once you have final-project.Qmd in your folder:\n\n")

cat("1. Open final-project.Qmd in RStudio\n")
cat("2. Click 'Render' button (top of editor)\n")
cat("3. It should create final-project.pdf\n\n")

cat("If you get errors:\n")
cat("  • Check data/ folder has all CSV files\n")
cat("  • Check you're in the project directory\n")
cat("  • Check packages are installed\n\n")

# ============================================================================
# SUMMARY
# ============================================================================

cat("\n")
cat("============================================================================\n")
cat("  ✓✓✓ SETUP COMPLETE! ✓✓✓\n")
cat("============================================================================\n\n")

cat("What you have now:\n")
cat("  ✓ Correct folder structure\n")
cat("  ✓ All data downloaded\n")
cat("  ✓ Packages installed\n")
cat("  ✓ Ready to work in Qmd\n\n")

cat("NEXT STEPS:\n")
cat("===========\n\n")

cat("1. Download final-project-FIXED.Qmd from Claude\n")
cat("2. Save it as 'final-project.Qmd' in your project folder\n")
cat("3. Download references.bib too\n")
cat("4. Open final-project.Qmd in RStudio\n")
cat("5. Render it to test\n")
cat("6. Add your gap analysis code\n")
cat("7. Complete Parts 2 and 3\n")
cat("8. Render final PDF and submit!\n\n")

cat("============================================================================\n\n")

cat("YOUR SUBMISSION FILES:\n")
cat("  1. final-project.Qmd\n")
cat("  2. final-project.pdf\n")
cat("  3. All data/*.csv files\n")
cat("  4. references.bib\n\n")

cat("Remember:\n")
cat("  • Use |> not %>%\n")
cat("  • Use relative paths only\n")
cat("  • All code in Qmd\n")
cat("  • Part 2 must have ORIGINAL examples\n\n")

cat("🎯 You're ready to go!\n\n")
