#' Include audio
#'
#' Includes an audio player for rmarkdown and quarto.
#' It is the knitr::include_graphics() for audio files.
#'
#' @param audio_path string with the path to the audio file (local or url)
#' @param width width (see [htmlwidgets::createWidget])
#' @param height height (see [htmlwidgets::createWidget])
#' @param elementId elementId (see [htmlwidgets::createWidget])
#' @import htmlwidgets
#'
#' @examples
#' include_audio("https://www2.cs.uic.edu/~i101/SoundFiles/PinkPanther30.wav")
#'
#' @export
include_audio <- function(audio_path, width = NULL, height = NULL, elementId = NULL) {

  x = list(
    audio_path = audio_path
  )

  # create widget
  htmlwidgets::createWidget(
    name = 'audioplayRmd',
    x,
    width = width,
    height = height,
    package = 'audioplayRmd',
    elementId = elementId,
    sizingPolicy(
      fill = FALSE,
      knitr.figure = FALSE,
      padding = 10,
      defaultWidth = 1,
      defaultHeight = 54
    )
  )
}

#' Shiny bindings for audioplayRmd
#'
#' Output and render functions for using audioplayRmd within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a audioplayRmd
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name audioplayRmd-shiny
#'
#' @export
audioplayRmdOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'audioplayRmd', width, height, package = 'audioplayRmd')
}

#' @rdname audioplayRmd-shiny
#' @export
renderAudioplayRmd <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, audioplayRmdOutput, env, quoted = TRUE)
}
