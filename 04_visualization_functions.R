# =============================================================================
# Script: 04_visualization_functions.R
# Purpose: Plotting functions for Children in Care analysis
# =============================================================================

library(tidyverse)
library(ggplot2)

# Set a consistent theme for all plots
theme_set(theme_minimal(base_size = 12))

# Custom color palette (Irish colors with neutrals)
care_colors <- c(
  "#169B62",  # Irish green
  "#FF883E",  # Orange
  "#0C2340",  # Navy
  "#7F7F7F",  # Gray
  "#C41E3A"   # Red
)

# -----------------------------------------------------------------------------
# PART 1: COMPARISON PLOTS
# -----------------------------------------------------------------------------

plot_care_vs_all_children <- function(comparison_data) {
  # YOUR LOGIC HERE: Create comparison plot
  # Suggested: Side-by-side bar chart or diverging bar chart
  
  cat("Creating care vs. all children comparison plot...\n")
  
  # Example structure:
  # p <- ggplot(comparison_data, aes(x = category, y = rate, fill = group)) +
  #   geom_col(position = "dodge") +
  #   labs(
  #     title = "YOUR TITLE",
  #     subtitle = "YOUR SUBTITLE",
  #     x = "YOUR X LABEL",
  #     y = "YOUR Y LABEL",
  #     caption = "Source: CSO, Educational Outcomes of Children in Care 2018-2025"
  #   ) +
  #   scale_fill_manual(values = care_colors) +
  #   theme_minimal()
  
  # return(p)
}

plot_gap_analysis <- function(gap_data) {
  # YOUR LOGIC HERE: Show the "gap" between children in care and all children
  # Suggested: Diverging bar chart or dumbbell plot
  
  cat("Creating gap analysis plot...\n")
  
  # return(p)
}

# -----------------------------------------------------------------------------
# PART 2: DEMOGRAPHIC PLOTS
# -----------------------------------------------------------------------------

plot_age_distribution <- function(data) {
  # YOUR LOGIC HERE: Show age distribution
  # Suggested: Histogram or density plot
  
  cat("Creating age distribution plot...\n")
  
  # return(p)
}

plot_placement_breakdown <- function(data) {
  # YOUR LOGIC HERE: Show placement types
  # Suggested: Stacked bar chart or pie chart (bar is better!)
  
  cat("Creating placement breakdown plot...\n")
  
  # return(p)
}

# -----------------------------------------------------------------------------
# PART 3: OUTCOME PLOTS
# -----------------------------------------------------------------------------

plot_outcomes_by_placement <- function(data) {
  # YOUR LOGIC HERE: Show outcomes by placement type
  # Suggested: Grouped bar chart or faceted plot
  
  cat("Creating outcomes by placement plot...\n")
  
  # Example structure:
  # p <- ggplot(data, aes(x = placement_type, y = outcome_rate, fill = outcome)) +
  #   geom_col(position = "dodge") +
  #   facet_wrap(~age_group) +
  #   labs(title = "YOUR TITLE") +
  #   coord_flip()  # Makes labels easier to read
  
  # return(p)
}

plot_temporal_trends <- function(trend_data) {
  # YOUR LOGIC HERE: Show trends over 2018-2024
  # Suggested: Line plot with multiple lines
  
  cat("Creating temporal trends plot...\n")
  
  # Example structure:
  # p <- ggplot(trend_data, aes(x = year, y = rate, color = category, group = category)) +
  #   geom_line(size = 1.2) +
  #   geom_point(size = 3) +
  #   labs(title = "YOUR TITLE")
  
  # return(p)
}

plot_age_trajectory <- function(data) {
  # YOUR LOGIC HERE: Show how outcomes change with age
  # Suggested: Line plot or area plot
  
  cat("Creating age trajectory plot...\n")
  
  # return(p)
}

# -----------------------------------------------------------------------------
# PART 4: ADVANCED VISUALIZATIONS
# -----------------------------------------------------------------------------

plot_outcome_heatmap <- function(data) {
  # YOUR LOGIC HERE: Create heatmap of outcomes
  # Suggested: geom_tile() for placement × age × outcome
  
  cat("Creating outcome heatmap...\n")
  
  # Example structure:
  # p <- ggplot(data, aes(x = factor1, y = factor2, fill = outcome_rate)) +
  #   geom_tile() +
  #   scale_fill_gradient(low = "white", high = care_colors[1]) +
  #   labs(title = "YOUR TITLE")
  
  # return(p)
}

plot_sankey_flow <- function(data) {
  # YOUR LOGIC HERE: Flow diagram (optional - advanced)
  # Shows flow from care type → placement → outcome
  # May require additional packages like ggalluvial
  
  cat("Creating Sankey flow diagram...\n")
  
  # return(p)
}

# -----------------------------------------------------------------------------
# PART 5: STATISTICAL PLOTS
# -----------------------------------------------------------------------------

plot_coefficient_plot <- function(model_results) {
  # YOUR LOGIC HERE: Plot model coefficients
  # Suggested: Forest plot style with error bars
  
  cat("Creating coefficient plot...\n")
  
  # Example structure:
  # p <- ggplot(model_results, aes(x = estimate, y = variable)) +
  #   geom_point() +
  #   geom_errorbarh(aes(xmin = conf_low, xmax = conf_high), height = 0.2) +
  #   geom_vline(xintercept = 0, linetype = "dashed") +
  #   labs(title = "YOUR TITLE")
  
  # return(p)
}

plot_distribution_comparison <- function(data) {
  # YOUR LOGIC HERE: Compare distributions between groups
  # Suggested: Overlapping density plots or violin plots
  
  cat("Creating distribution comparison plot...\n")
  
  # return(p)
}

# -----------------------------------------------------------------------------
# HELPER FUNCTIONS FOR PLOT FORMATTING
# -----------------------------------------------------------------------------

format_percentage_axis <- function(plot) {
  # YOUR LOGIC HERE: Format y-axis as percentages
  # plot + scale_y_continuous(labels = scales::percent_format())
}

add_data_labels <- function(plot, data) {
  # YOUR LOGIC HERE: Add value labels to bars
  # plot + geom_text(data = data, aes(label = value), vjust = -0.5)
}

save_plot_high_quality <- function(plot, filename, width = 10, height = 6) {
  # YOUR LOGIC HERE: Save plot in high quality
  
  cat("Saving plot:", filename, "\n")
  
  # Create plots directory
  if (!dir.exists("plots")) {
    dir.create("plots")
  }
  
  # ggsave(
  #   filename = paste0("plots/", filename),
  #   plot = plot,
  #   width = width,
  #   height = height,
  #   dpi = 300,
  #   bg = "white"
  # )
}

# -----------------------------------------------------------------------------
# COMBO FUNCTION: Generate all main plots
# -----------------------------------------------------------------------------

generate_all_plots <- function(data, comparison_data, trend_data) {
  # YOUR LOGIC HERE: Generate all key plots at once
  # Use purrr::map() to create multiple plots efficiently!
  
  cat("Generating all plots...\n")
  
  # Example using purrr:
  # plot_functions <- list(
  #   demographics = plot_age_distribution,
  #   placement = plot_placement_breakdown,
  #   outcomes = plot_outcomes_by_placement
  # )
  # 
  # plots <- map(plot_functions, ~.x(data))
  
  # return(plots)
}

# -----------------------------------------------------------------------------
# QUALITY REMINDERS
# -----------------------------------------------------------------------------

cat("\n=============================================================================\n")
cat("VISUALIZATION FUNCTIONS LOADED\n")
cat("\nREMINDER - Every plot should have:\n")
cat("  ✓ Clear title and subtitle\n")
cat("  ✓ Axis labels with units\n")
cat("  ✓ Legend if needed\n")
cat("  ✓ Data source in caption\n")
cat("  ✓ Appropriate colors (colorblind-friendly!)\n")
cat("  ✓ Clean, minimal design\n")
cat("\nAnd remember: COMMENT every plot in your Qmd file!\n")
cat("=============================================================================\n\n")
