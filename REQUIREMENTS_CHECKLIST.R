# ============================================================================
# ⚠️ CRITICAL PROJECT REQUIREMENTS - QUICK REFERENCE
# ============================================================================

# ============================================================================
# RULE #1: NATIVE PIPE |> NOT %>%
# ============================================================================

# ❌ WRONG:
data %>% filter(x > 5) %>% select(y)

# ✅ CORRECT:
data |> filter(x > 5) |> select(y)

# Why? Project specs say: "Don't use the magrittr pipe %>% when you can 
# use the native pipe operator |>"

# ============================================================================
# RULE #2: RELATIVE PATHS ONLY
# ============================================================================

# ❌ WRONG:
setwd("C:/Users/caola/Documents/...")
data <- read_csv("C:/Users/caola/.../data.csv")

# ✅ CORRECT:
# No setwd() at all!
data <- read_csv("data/EAACC01.csv")

# Why? Project specs say: "Save the data file in the same folder as the 
# .Qmd file, so that you don't have to specify the file path"

# ============================================================================
# RULE #3: ALL CODE IN QMD FILE
# ============================================================================

# ❌ WRONG:
# Having separate R scripts and sourcing them:
source("01_download.R")
source("02_cleaning.R")

# ✅ CORRECT:
# All code directly in code chunks in the Qmd file:
# ```{r download-data}
# # Code here
# ```

# Why? They need to render your Qmd without modifications

# ============================================================================
# RULE #4: USE PURRR (REQUIRED!)
# ============================================================================

# ✅ You MUST use at least one purrr function

# Good examples:
map(list_of_data, function(x) calculate_something(x))
map_df(years, ~analyze_year(.x))
walk2(files, names, ~write_csv(.x, .y))

# ============================================================================
# RULE #5: PART 2 - ORIGINAL EXAMPLES ONLY
# ============================================================================

# ❌ WRONG:
# Copying examples from:
# - Package help pages (?function_name)
# - Tutorials online
# - Package vignettes

# ✅ CORRECT:
# Create YOUR OWN examples using:
# - Your data
# - Different context
# - Original scenarios

# ============================================================================
# RULE #6: PART 3 - DIFFERENT METHODS
# ============================================================================

# print() and summary() must be VERY different!

# ❌ WRONG (too similar):
print.myclass <- function(x) {
  cat("Results:", x$value, "\n")
}

summary.myclass <- function(x) {
  cat("Summary of results:", x$value, "\n")
}

# ✅ CORRECT (very different):
print.myclass <- function(x) {
  cat("Analysis complete\n")
  cat("n =", x$n, "\n")
}

summary.myclass <- function(x) {
  cat("Detailed Statistics\n")
  cat("Mean:", mean(x$data), "\n")
  cat("SD:", sd(x$data), "\n")
  cat("Model coefficients:\n")
  print(x$model$coefficients)
  cat("Significance tests:\n")
  print(x$tests)
}

# ============================================================================
# SUBMISSION CHECKLIST
# ============================================================================

# You must submit:
# ☐ final-project.Qmd
# ☐ final-project.pdf (rendered from Qmd)
# ☐ All data files (EAACC*.csv)
# ☐ references.bib

# Your Qmd must have:
# ☐ Part 1: Data analysis (using purrr!)
# ☐ Part 2: R package demo (3 functions, original examples)
# ☐ Part 3: Your function with S3/S4 class and methods

# Your code must:
# ☐ Use |> not %>%
# ☐ Use relative paths only
# ☐ Be commented clearly
# ☐ Have commentary explaining every plot/table
# ☐ Work when they render it without changes

# ============================================================================
# WHAT GETS YOU MARKS
# ============================================================================

# Part 1 (20 marks):
# • Using functions correctly
# • Using purrr functions
# • Clear code comments
# • Good quality graphics
# • Interpretation of results
# • Good structure
# • Clear conclusions

# Part 2 (10 marks):
# • Clear package purpose
# • Demonstrating 3 main functions
# • Original examples (NOT from help!)
# • Clear code and output

# Part 3 (15 marks):
# • Working function
# • Appropriate S3/S4 class
# • Different print/summary methods
# • Working plot method
# • Clear comments and example

# Quarto (5 marks):
# • Three sections clearly identifiable
# • Code and output shown correctly
# • Nice formatting
# • Renders without errors

# ============================================================================
# COMMON MISTAKES TO AVOID
# ============================================================================

# ❌ Using %>% instead of |>
# ❌ Using absolute file paths
# ❌ Forgetting to use purrr
# ❌ Copying examples from help pages (Part 2)
# ❌ print() and summary() too similar (Part 3)
# ❌ Not commenting code
# ❌ Not explaining plots/tables
# ❌ Code that doesn't run

# ============================================================================
# QUICK TEST
# ============================================================================

cat("\nQuick compatibility test:\n\n")

# Test 1: Check for magrittr pipe
cat("1. Search your Qmd for '%>%' - should find ZERO\n")

# Test 2: Check for setwd
cat("2. Search your Qmd for 'setwd' - should find ZERO\n")

# Test 3: Check for absolute paths
cat("3. Search your Qmd for 'C:/' or 'Users' - should find ZERO\n")

# Test 4: Check for purrr
cat("4. Search your Qmd for 'map' or 'walk' - should find AT LEAST ONE\n")

# Test 5: Try rendering
cat("5. Click 'Render' - should create PDF without errors\n\n")

cat("If all 5 tests pass, you're ready to submit! ✓\n\n")
