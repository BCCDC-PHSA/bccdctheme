
#' @noRd
get_png <- function(filename) {
  grid::rasterGrob(png::readPNG(filename),
                   interpolate = TRUE,
                   x = grid::unit(0, "npc") + grid::unit(60, "pt"),
                   y = grid::unit(0, "npc") - grid::unit(20, "pt"),
                   height = grid::unit(30, "pt"),
                   hjust = 1,
                   vjust = 1
  )
}

#' Custom BCCDC ggplot theme
#' @param include_logo Optional boolean, if `TRUE` includes logo in bottom-left
#' corner of the plot
#' @export
bccdc_theme <- function(include_logo = TRUE) {
  bccdc_colors <- c("#003E79", "#009FD8", "#D3EDEF", "#8CD6F8", "#1A0757", "#01809D")

  base_font <- "sans"

  theme_list <- list(
    ggplot2::theme_minimal(),
    ggplot2::theme(
      plot.title      = ggplot2::element_text(family = base_font, size = 16, face = "bold"),
      plot.subtitle   = ggplot2::element_text(family = base_font, size = 12),
      plot.caption    = ggplot2::element_text(family = base_font, hjust = 1, size = 8),

      axis.title      = ggplot2::element_text(family = base_font, size = 12),
      axis.text       = ggplot2::element_text(family = base_font, size = 10),

      legend.title    = ggplot2::element_text(family = base_font, size = 11),
      legend.text     = ggplot2::element_text(family = base_font, size = 10),

      strip.text      = ggplot2::element_text(family = base_font, size = 11, face = "bold")
    ),
    ggplot2::scale_colour_manual(values = bccdc_colors),
    ggplot2::scale_fill_manual(values = bccdc_colors),
    ggplot2::labs(caption = "Source: BC Centre for Disease Control")
  )

  if(include_logo){
    logo_path <- system.file("extdata", "logo.png", package = "bccdctheme")
    logo <- get_png(logo_path)

    theme_list <- theme_list |>
      append(
        list(
          ggplot2::theme(
            # space for logo
            plot.margin = grid::unit(c(1, 1, 3, 1), "lines")
          ),
          ggplot2::coord_cartesian(clip = "off"),
          ggplot2::annotation_custom(grob = logo)
    ))
  }

  return(theme_list)
}
