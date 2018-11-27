# `progressbar` Package
  
This package allow R user to simply monitor loop execution (apply,for).

## Installation

First of all you must install the devtools package in order to isntall package from github

```r
install.packages('devtools')
```

Then install the `progressbar` package using the `install_github` function

```r
devtools::install_github('zwanto/progressbar')
```

## Usage

### `for` loop

```r
library(progressbar)

max = 20
min = 1

pb = progressBar(min=min,max=max) # progress bar initialization

for (i in min:max){
  
  # Your expressions
  Sys.sleep(runif(n = 1,min = 0.2,max = 1))
  
  # Important part
  print(pb) # Refresh the progress bar
}
```

### `apply` loop

```r
library(progressbar)

vect = 1:20

pb = progressBar(min = 1, max = length(vect)) # progress bar initialization

apply(vect,function(x){

  # Your expressions
  Sys.sleep(runif(n = 1,min = 0.2,max = 1))
  
  # Important part
  print(pb) # Refresh the progress bar
})
```