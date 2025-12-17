# Educational Outcomes of Children in Care in Ireland (2018-2025)

## Final Project for STAT30340/STAT40730 Data Programming with R

**Student:** [Your Name]  
**Due Date:** December 17, 2025

---

## Project Overview

This project analyzes educational outcomes for children in care in Ireland using data from the Central Statistics Office (CSO). The analysis examines:

- Educational attainment gaps between children in care and the general population
- Effects of placement type (foster care vs. residential care) on outcomes
- Predictors of educational and employment success
- Temporal trends from 2018-2025

**Data Source:** CSO - Educational Attendance, Attainment and Other Outcomes of Children in Care, 2018-2025

---

## Repository Structure

```
.
├── README.md                    # This file
├── final-project.Qmd           # Main Quarto document (your work goes here!)
├── references.bib              # Bibliography for citations
├── data/
│   ├── raw/                    # Raw downloaded data (CSO CSV files)
│   └── processed/              # Cleaned data ready for analysis
├── scripts/
│   ├── 01_download_data.R      # Download data from CSO PxStat
│   ├── 02_data_cleaning.R      # Clean and prepare data
│   ├── 03_analysis_functions.R # Analysis functions (YOUR LOGIC)
│   └── 04_visualization_functions.R # Plotting functions (YOUR LOGIC)
└── plots/                      # Generated visualizations
```

---

## How to Use This Project

### Step 1: Download the Data

```r
source("scripts/01_download_data.R")
# This will download data from CSO PxStat into data/raw/
```

**Note:** You may need to install the `csodata` package:
```r
install.packages("csodata")
```

### Step 2: Clean the Data

```r
source("scripts/02_data_cleaning.R")
# This will clean the raw data and save to data/processed/
# YOU NEED TO FILL IN THE LOGIC!
```

### Step 3: Complete the Analysis Functions

Edit `scripts/03_analysis_functions.R` and fill in the logic for:
- Demographic summaries
- Outcome calculations (MUST USE PURRR!)
- Statistical analyses
- Predictive modeling

### Step 4: Complete the Visualization Functions

Edit `scripts/04_visualization_functions.R` and create your plots:
- Comparison plots
- Demographic visualizations
- Outcome analyses
- Trend charts

### Step 5: Complete the Quarto Document

Edit `final-project.Qmd` and:
- Add your introduction and conclusions
- Run your analysis functions
- Create plots and tables
- Comment on every single output
- Complete Parts 2 (Package Demo) and 3 (Functions)

### Step 6: Render Your Document

```r
quarto::quarto_render("final-project.Qmd")
```

Or use RStudio's "Render" button.

---

## Project Requirements

### Part 1: Analysis (20 marks)
- [x] Dataset with ≥2 categorical and ≥3 numerical variables
- [ ] Use at least one purrr function (REQUIRED!)
- [ ] Only use packages from the module
- [ ] Clear introduction and conclusion
- [ ] Every plot/table commented
- [ ] Proper data citations

### Part 2: R Package (10 marks)
- [ ] Choose package not used in module
- [ ] Demonstrate 3 functions
- [ ] Use original examples (not from help pages!)
- [ ] Cite package properly

### Part 3: Functions/Programming (15 marks)
- [ ] Create statistical analysis function
- [ ] Assign S3 class
- [ ] Create print() method
- [ ] Create summary() method (DIFFERENT from print!)
- [ ] Create plot() method
- [ ] Include working example

### Quarto (5 marks)
- [ ] Three sections clearly identifiable
- [ ] All code visible and commented
- [ ] Clean formatting (no text beyond margins)
- [ ] Renders without errors
- [ ] Proper citations

---

## Key Data Tables (CSO PxStat)

- **EAACC01:** Characteristics by age
- **EAACC02:** Placement type
- **EAACC03:** Nationality  
- **EAACC04:** Sex
- **EAACC05:** Early school leavers
- **EAACC06:** Employment/education status by year
- **EAACC07:** Education enrollments
- **EAACC08:** School attendance
- **EAACC09:** School attainment
- **EAACC10:** Employment/education outcomes

---

## Important Reminders

### Use Native Pipe `|>`
Don't use magrittr pipe `%>%` unless absolutely necessary. Use the native pipe `|>` instead.

### Purrr Usage (REQUIRED!)
You MUST use at least one purrr function. Good options:
- `map()` - apply function to each element
- `map_dbl()` - return numeric vector
- `map2()` - apply function to two lists
- `walk()` - for side effects

### Citation
Always cite your data source:
```
@misc{cso_children_care_2024,
  title = {Educational Attendance, Attainment and Other Outcomes of Children in Care, 2018-2025},
  author = {{Central Statistics Office}},
  year = {2024},
  publisher = {Central Statistics Office, Ireland},
  url = {https://www.cso.ie/en/statistics/education/educationalattendanceandattainmentofchildrenincare/}
}
```

---

## Getting Help

### Data Documentation
- CSO Release: https://www.cso.ie/en/releasesandpublications/fp/fp-eaacc/
- PxStat Database: https://data.cso.ie/

### R Help
- `?function_name` - Function help
- `help.search("topic")` - Search help
- `vignette("package_name")` - Package vignettes

### Project Structure
- All code goes in `scripts/` folder
- All analysis happens in `final-project.Qmd`
- Data stays in `data/` folder

---

## Submission

Submit to Brightspace:
1. `final-project.Qmd` (your source file)
2. `final-project.pdf` (rendered output)
3. Any data files needed to render

**Deadline:** Wednesday, December 17, 2025, 11:59 PM

---

## Contact

**Lecturer:** Isabella Gollini  
**Module:** STAT30340/STAT40730 Data Programming with R  
**Email:** [Insert module email]

---

## License

This project uses public data from the Central Statistics Office (CSO) Ireland.
All analysis code is for educational purposes.

---

**Good luck with your project! Remember to start early and test your code frequently!**
