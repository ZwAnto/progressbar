#' progressBar printing function
#'
#' @param progress 
#'
#' @seealso \code{\link{progressBar}}
#'
#' @export
print.progressBar <- function(progress,...){
  
  .args <- as.list(match.call())
  .calling_env <- parent.env(environment())
  .progress_name <- paste(.args$progress)
  
  t_update = Sys.time() - progress$t_update
  
  if(t_update > progress$refresh) {
    
    n_finish = round(progress$actual/progress$length*progress$width)
    n_remain = progress$width - n_finish - 1
    
    t_remain = as.integer((Sys.time() - progress$t_init)/n_finish * (n_remain+1))
    t_remain = paste0(formatC(t_remain %/% 3600,width = 2,flag = 0),
                      ":",
                      formatC(t_remain %% 3600 %/% 60,width = 2,flag = 0),
                      ":",
                      formatC(t_remain %% 3600 %% 60,width = 2,flag = 0))
    
    if (n_remain>0){
      text_bar = paste0(paste0(rep('=',n_finish),collapse = ''),'>',paste0(rep('.',n_remain),collapse = ''))
    } else if(n_finish == progress$width) {
      text_bar = paste0(paste0(rep('=',n_finish),collapse = ''))
    } else {
      text_bar = paste0(paste0(rep('=',n_finish),collapse = ''),'>')
    }
    
    text_bar <- paste0('[', text_bar,']')
    text_bar <- paste0(progress$actual,'/',progress$length,' ',text_bar,' ETA ',  t_remain)
    
    cat("\r",text_bar, sep = "",file = stderr())
    utils::flush.console() 
    
    progress$t_update <- Sys.time()
  }
  
  progress$actual <- progress$actual + 1
  assign(.progress_name,value = progress,envir = .calling_env)
}
