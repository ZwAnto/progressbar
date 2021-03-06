% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/progressBar.R
\name{progressBar}
\alias{progressBar}
\title{Console Progress Bar}
\usage{
progressBar(min = 0, max = 100, width = 30, refresh = 0.5,
  envir = parent.frame(1), output = stderr)
}
\arguments{
\item{min}{Startint value of iteration.}

\item{max}{Ending value of iteration.}

\item{width}{Width of the progress bar.}

\item{refresh}{Minimum refreshing time in seconds.}

\item{envir}{Environment of progressBar object}

\item{output}{Where to print progress bar. Default to stderr()}
}
\value{
Object of class progressBar
}
\description{
Console Progress Bar
}
\examples{
total <- 20
pb = progressBar(min = 0, max = total)

for(i in 0:total){
  Sys.sleep(0.1)
  print(pb)                    
}

}
