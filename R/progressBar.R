
#' Console Progress Bar 
#'
#' @param min Startint value of iteration.
#' @param max Ending value of iteration.
#' @param width Width of the progress bar.
#' @param refresh Minimum refreshing time in seconds.
#'
#' @return Object of class progressBar
#' @export
#'
#' @examples 
#' total <- 20
#' pb = progressBar(min = 0, max = total)
#' 
#' for(i in 0:total){
#'   Sys.sleep(0.1)
#'   show(pb)                    
#' }
#' 
progressBar <- function(min = 0, max = 100, width = 30, refresh = 0.5){
  progress <- list(length = length(min:max),
                   actual = 1,
                    width = 30,
                    t_init = Sys.time(),
                    t_update = Sys.time(),
                    refresh = refresh)
  attr(progress, "class") <- "progressBar"
  return(progress)
}