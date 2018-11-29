#' progressBar printing function
#'
#' @param progress 
#'
#' @seealso \code{\link{progressBar}}
#'
#' @export
print.progressBar <- function(object){
  
  .args <- as.list(match.call())
  .progress_name <- paste(.args$object)
  .calling_env <- object$envir
  
  t_update = Sys.time() - object$t_update
  
  if(t_update > object$refresh) {
    
    n_finish = round(object$actual/object$length*object$width)
    n_remain = object$width - n_finish - 1
    
    t_remain = as.numeric(difftime(Sys.time(),object$t_init,units = 's'))/object$actual * (object$length-object$actual)

    if (is.infinite(t_remain)) t_remain <- 0
    t_remain = paste0(formatC(t_remain %/% 3600,width = 2,flag = 0),
                      ":",
                      formatC(t_remain %% 3600 %/% 60,width = 2,flag = 0),
                      ":",
                      formatC(as.integer(t_remain %% 3600 %% 60),width = 2,flag = 0,digits=0))
    
    if (n_remain>0){
      text_bar = paste0(paste0(rep('=',n_finish),collapse = ''),'>',paste0(rep('.',n_remain),collapse = ''))
    } else if(n_finish == object$width) {
      text_bar = paste0(paste0(rep('=',n_finish),collapse = ''))
    } else {
      text_bar = paste0(paste0(rep('=',n_finish),collapse = ''),'>')
    }
    
    text_bar <- paste0('[', text_bar,']')
    text_bar <- paste0(object$actual,'/',object$length,' ',text_bar,' ETA ',  t_remain)
    
    cat("\r",text_bar, sep = "",file = object$output())
    utils::flush.console() 
    
    .calling_env[[.progress_name]]$t_update <- Sys.time()
  }
  
  .calling_env[[.progress_name]]$actual <- object$actual + 1
  
}
