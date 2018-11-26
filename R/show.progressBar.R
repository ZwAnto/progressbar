#' progressBar printing function
#'
#' @param progress 
#'
#' @seealso \code{\link{progressBar}}
#'
#' @export
show.progressBar <- function(object){
  
  .args <- as.list(match.call())
  .calling_env <- object$envir
  .progress_name <- paste(.args$object)
  
  t_update = Sys.time() - object$t_update
  
  if(t_update > object$refresh) {
    
    n_finish = round(object$actual/object$length*object$width)
    n_remain = object$width - n_finish - 1
    
    t_remain = round(as.numeric((Sys.time() - object$t_init)/n_finish * (n_remain+1)))
    t_remain = paste0(formatC(t_remain %/% 3600,width = 2,flag = 0),
                      ":",
                      formatC(t_remain %% 3600 %/% 60,width = 2,flag = 0),
                      ":",
                      formatC(t_remain %% 3600 %% 60,width = 2,flag = 0))
    
    if (n_remain>0){
      text_bar = paste0(paste0(rep('=',n_finish),collapse = ''),'>',paste0(rep('.',n_remain),collapse = ''))
    } else if(n_finish == object$width) {
      text_bar = paste0(paste0(rep('=',n_finish),collapse = ''))
    } else {
      text_bar = paste0(paste0(rep('=',n_finish),collapse = ''),'>')
    }
    
    text_bar <- paste0('[', text_bar,']')
    text_bar <- paste0(object$actual,'/',object$length,' ',text_bar,' ETA ',  t_remain)
    
    cat("\r",text_bar, sep = "",file = stderr())
    utils::flush.console() 
    
    object$t_update <- Sys.time()
  }
  
  object$actual <- object$actual + 1
  assign(.progress_name,value = object,envir = .calling_env)
}
